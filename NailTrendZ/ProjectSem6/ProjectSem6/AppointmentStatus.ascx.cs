using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class AppointmentStatus1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login_form.aspx");
            }

            if (!IsPostBack)
            {
                LoadAllAppointments();
            }
        }

        private void LoadAllAppointments()
        {
            string userId = Session["UserID"]?.ToString();
            if (string.IsNullOrEmpty(userId))
            {
                ShowAlert("User not logged in.");
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                string query = @"
                    SELECT AppointmentID, FullName, AppointmentDate, AppointmentTime, TotalBillAmount, Status 
                    FROM Appointments 
                    WHERE UserID = @UserID 
                    ORDER BY AppointmentDate DESC, AppointmentTime DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                SqlDataReader reader = cmd.ExecuteReader();
                var appointmentList = new List<AppointmentData>();

                while (reader.Read())
                {
                    string appointmentTime = reader["AppointmentTime"] != DBNull.Value
                        ? Convert.ToDateTime(reader["AppointmentTime"]).ToString("hh:mm tt")
                        : "Not Set";

                    var appointment = new AppointmentData(
                        reader["FullName"].ToString(),
                        Convert.ToDateTime(reader["AppointmentDate"]).ToString("yyyy-MM-dd"),
                        appointmentTime,
                        Convert.ToDecimal(reader["TotalBillAmount"]).ToString("C"),
                        reader["Status"].ToString()
                    );

                    appointmentList.Add(appointment);
                }

                if (appointmentList.Count > 0)
                {
                    rptAppointments.DataSource = appointmentList;
                    rptAppointments.DataBind();
                }
                else
                {
                    ShowAlert("No appointments found.");
                }
            }
        }

        protected string GetStatusCss(string status)
        {
            switch (status)
            {
                case "Pending":
                    return "status-pending";
                case "Confirmed":
                    return "status-confirmed";
                case "Cancelled":
                    return "status-cancelled";
                default:
                    return "";
            }
        }

        private void ShowAlert(string message)
        {
            string script = $"alert('{message}'); window.location='index.aspx';";
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", script, true);
        }

        [Serializable]
        private class AppointmentData
        {
            public string FullName { get; }
            public string AppointmentDate { get; }
            public string AppointmentTime { get; }
            public string TotalAmount { get; }
            public string Status { get; }

            public AppointmentData(string fullName, string appointmentDate, string appointmentTime, string totalAmount, string status)
            {
                FullName = fullName;
                AppointmentDate = appointmentDate;
                AppointmentTime = appointmentTime;
                TotalAmount = totalAmount;
                Status = status;
            }
        }
    }
}
