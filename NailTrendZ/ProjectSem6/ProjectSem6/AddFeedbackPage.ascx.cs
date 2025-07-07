using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class AddFeedbackPage1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) // Check if session is empty
            {
                Response.Redirect("Login_form.aspx"); // Redirect to login page
            }
        }

        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            // Retrieve input values
            string customerName = txtCustomerName.Text.Trim();
            string comments = txtComments.Text.Trim();

            // Retrieve UserID from session
            int userID = GetUserIDFromSession();

            if (userID == -1)
            {
                ShowAlert("You must be logged in to submit feedback!", "error");
                return;
            }

            if (string.IsNullOrEmpty(customerName) || string.IsNullOrEmpty(comments))
            {
                ShowAlert("Both fields are required!", "error");
                return;
            }

            // Insert feedback into the database
            string connString = ConfigurationManager.ConnectionStrings["NailTrendZDB"]?.ConnectionString;

            if (string.IsNullOrEmpty(connString))
            {
                ShowAlert("Database connection error.", "error");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO dbo.Feedbacks (CustomerName, Comments, CreatedAt, UserID) VALUES (@CustomerName, @Comments, GETDATE(), @UserID)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@CustomerName", customerName);
                cmd.Parameters.AddWithValue("@Comments", comments);
                cmd.Parameters.AddWithValue("@UserID", userID);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    // Show alert box after successful submission
                    Response.Write("<script>alert('Thank you for your feedback!'); window.location='customer.aspx';</script>");

                    // Clear form fields
                    ClearForm();
                }
                catch (Exception ex)
                {
                    ShowAlert("Error: " + ex.Message, "error");
                }
            }
        }


        /// <summary>
        /// Retrieves the UserID from session.
        /// </summary>
        /// <returns>UserID if session exists; otherwise, returns -1.</returns>
        private int GetUserIDFromSession()
        {
            if (Session["UserID"] != null)
            {
                int userID;
                if (int.TryParse(Session["UserID"].ToString(), out userID))
                {
                    return userID;
                }
            }
            return -1; // Return -1 if no valid UserID in session
        }

        private void ClearForm()
        {
            txtCustomerName.Text = "";
            txtComments.Text = "";
        }
        private void ShowAlert(string message, string type)
        {
            string alertType = type == "success" ? "success" : "error";
            string script = $@"
                Swal.fire({{
                    title: '{message}',
                    icon: '{alertType}',
                    confirmButtonText: 'OK'
                }});";

            ScriptManager.RegisterStartupScript(this, GetType(), "alert", script, true);
        }
    }
}
