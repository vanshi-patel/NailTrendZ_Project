using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class AdminAppointments : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🚨 Redirect to login if session is missing
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(@"
                    SELECT AppointmentID, 
                           FullName, 
                           Email, 
                           PhoneNumber, 
                           CONVERT(VARCHAR, AppointmentDate, 23) AS AppointmentDate, 
                           CAST(AppointmentTime AS DATETIME) AS AppointmentTime,
                           TotalBillAmount,
                           Status
                    FROM Appointments", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvAppointments.DataSource = dt;
                    gvAppointments.DataBind();
                }
            }
        }

        protected void gvAppointments_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAppointments.EditIndex = e.NewEditIndex;
            LoadAppointments();
        }

        protected void gvAppointments_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvAppointments.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvAppointments.DataKeys[e.RowIndex].Value);

            DateTime date;
            if (!DateTime.TryParse((row.FindControl("txtDate") as TextBox)?.Text, out date))
            {
                date = DateTime.MinValue;
            }

            TimeSpan time;
            if (!TimeSpan.TryParse((row.FindControl("txtTime") as TextBox)?.Text, out time))
            {
                time = TimeSpan.Zero;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(@"
            UPDATE Appointments 
            SET AppointmentDate=@Date, 
                AppointmentTime=@Time
            WHERE AppointmentID=@ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.Parameters.AddWithValue("@Date", date);
                    cmd.Parameters.AddWithValue("@Time", time);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            gvAppointments.EditIndex = -1;
            LoadAppointments();
        }


        protected void gvAppointments_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvAppointments.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Appointments WHERE AppointmentID=@ID", con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            LoadAppointments();
        }

        protected void gvAppointments_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAppointments.EditIndex = -1;
            LoadAppointments();
        }

        protected void gvAppointments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Confirm" || e.CommandName == "Cancel")
            {
                int appointmentId = Convert.ToInt32(e.CommandArgument);
                string status = (e.CommandName == "Confirm") ? "Confirmed" : "Cancelled";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("UPDATE Appointments SET Status = @Status WHERE AppointmentID = @AppointmentID", conn))
                    {
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@AppointmentID", appointmentId);
                        cmd.ExecuteNonQuery();
                    }
                }
                LoadAppointments();
            }
        }
    }
}
