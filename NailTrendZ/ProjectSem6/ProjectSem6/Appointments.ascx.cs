using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using ProjectSem6.Models;
using System.Collections.Generic;
using System.Linq;

namespace ProjectSem6
{
    public partial class Appointments : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) // Check if session is empty
            {
                Response.Redirect("Login_form.aspx"); // Redirect to login page
            }
            if (!IsPostBack) LoadCart();
        }

        private void LoadCart()
        {
            var cart = Session["Cart"] as List<Product>;
            decimal totalAmount = cart?.Sum(p => p.Price) ?? 0;

            Showalert(cart?.Any() == true
                ? $"Total Bill Amount: {totalAmount:C}"
                : "Your Bag is empty! Add designs before booking.",
                cart?.Any() != true);
        }

        protected void SubmitAppointment(object sender, EventArgs e)
        {
            if (!ValidateForm()) return;

            if (!(Session["Cart"] is List<Product> cart) || cart.Count == 0)
            {
                ShowAlert("Your Bag is empty! Add designs before booking.");
                return;
            }

            decimal totalBill = cart.Sum(p => p.Price);
            int userId = Convert.ToInt32(Session["UserID"]); // Get UserID from session

            string connString = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();
                bool transactionCompleted = false;

                try
                {
                    int appointmentId = InsertAppointment(conn, transaction, userId, totalBill);
                    if (appointmentId == 0)
                    {
                        throw new Exception("Failed to insert appointment.");
                    }

                    if (!InsertAppointmentDesigns(conn, transaction, appointmentId, cart))
                    {
                        throw new Exception("Failed to save appointment designs.");
                    }

                    transaction.Commit();
                    transactionCompleted = true; // Mark as committed

                    // Store the last booked appointment ID in session
                    Session["LastBookedAppointmentID"] = appointmentId;

                    Session["Cart"] = null;
                    ClearFields();

                    // Redirect to appointment status page with appointmentId
                    Response.Redirect($"AppointmentStatus.aspx?appointmentId={appointmentId}");
                }
                catch (Exception ex)
                {
                    if (!transactionCompleted) // Only rollback if not committed
                    {
                        transaction.Rollback();
                    }

                    ShowAlert("Error: " + ex.Message);
                }
            }
        }


        private bool ValidateForm()
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text) ||
                string.IsNullOrWhiteSpace(txtDate.Text) ||
                string.IsNullOrWhiteSpace(txtTime.Text))
            {
                ShowAlert("All fields are required!");
                return false;
            }

            // Validate Indian Mobile Number (10 digits, starts with 6-9)
            string phonePattern = @"^[6-9]\d{9}$";
            if (!System.Text.RegularExpressions.Regex.IsMatch(txtPhone.Text, phonePattern))
            {
                ShowAlert("Invalid mobile number! Enter a 10-digit Indian mobile number (starting with 6-9).");
                return false;
            }

            if (!DateTime.TryParse(txtDate.Text, out DateTime appointmentDate))
            {
                ShowAlert("Invalid date format!");
                return false;
            }

            if (appointmentDate < DateTime.Today)
            {
                ShowAlert("Past dates are not allowed. Please select a future date.");
                return false;
            }

            if (!TimeSpan.TryParse(txtTime.Text, out TimeSpan appointmentTime))
            {
                ShowAlert("Invalid time format!");
                return false;
            }

            TimeSpan openingTime = new TimeSpan(9, 0, 0);  // 9:00 AM
            TimeSpan closingTime = new TimeSpan(19, 0, 0); // 7:00 PM

            if (appointmentTime < openingTime || appointmentTime > closingTime)
            {
                ShowAlert("Appointments are only allowed between 9:00 AM and 7:00 PM.");
                return false;
            }

            return true;
        }

        private int InsertAppointment(SqlConnection conn, SqlTransaction transaction, int userId, decimal totalBill)
        {
            string query = @"
                INSERT INTO Appointments 
                (UserID, FullName, Email, PhoneNumber, AppointmentDate, AppointmentTime, TotalBillAmount) 
                OUTPUT INSERTED.AppointmentID 
                VALUES (@UserID, @FullName, @Email, @Phone, @Date, @Time, @TotalBill)";

            using (SqlCommand cmd = new SqlCommand(query, conn, transaction))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Date", DateTime.Parse(txtDate.Text));
                cmd.Parameters.AddWithValue("@Time", TimeSpan.Parse(txtTime.Text).ToString(@"hh\:mm\:ss"));
                cmd.Parameters.AddWithValue("@TotalBill", totalBill);

                return (int)(cmd.ExecuteScalar() ?? 0);
            }
        }

        private bool InsertAppointmentDesigns(SqlConnection conn, SqlTransaction transaction, int appointmentId, List<Product> cart)
        {
            decimal totalDesignPrice = cart.Sum(p => p.Price);
            int totalQuantity = cart.Count;

            string checkQuery = @"
                SELECT COUNT(*) FROM AppointmentDesigns 
                WHERE AppointmentID = @AppointmentID";

            string updateQuery = @"
                UPDATE AppointmentDesigns 
                SET DesignPrice = @DesignPrice, Quantity = @Quantity 
                WHERE AppointmentID = @AppointmentID";

            string insertQuery = @"
                INSERT INTO AppointmentDesigns (AppointmentID, DesignPrice, Quantity) 
                VALUES (@AppointmentID, @DesignPrice, @Quantity)";

            using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn, transaction))
            {
                checkCmd.Parameters.AddWithValue("@AppointmentID", appointmentId);
                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)  // If appointment already exists, update total price & quantity
                {
                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn, transaction))
                    {
                        updateCmd.Parameters.AddWithValue("@AppointmentID", appointmentId);
                        updateCmd.Parameters.AddWithValue("@DesignPrice", totalDesignPrice);
                        updateCmd.Parameters.AddWithValue("@Quantity", totalQuantity);

                        if (updateCmd.ExecuteNonQuery() <= 0) return false;
                    }
                }
                else  // If appointment does not exist, insert new row
                {
                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn, transaction))
                    {
                        insertCmd.Parameters.AddWithValue("@AppointmentID", appointmentId);
                        insertCmd.Parameters.AddWithValue("@DesignPrice", totalDesignPrice);
                        insertCmd.Parameters.AddWithValue("@Quantity", totalQuantity);

                        if (insertCmd.ExecuteNonQuery() <= 0) return false;
                    }
                }
            }
            return true;
        }

        private void ShowAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('{message}');", true);
        }

        private void Showalert(string message, bool redirect)
        {
            string script = redirect
                ? $"alert('{message}'); window.location='moreproducts.aspx';"
                : $"alert('{message}');";

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", script, true);
        }

        private void ClearFields()
        {
            txtName.Text = txtEmail.Text = txtPhone.Text = txtDate.Text = txtTime.Text = "";
        }
    }
}
