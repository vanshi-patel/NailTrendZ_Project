using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace ProjectSem6
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected string AppointmentsDataJson;
        protected string RevenueDataJson;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadChartData();

                // Ensure JSON is properly encoded and passed to frontend
                string script = $@"
                    var appointmentsData = {AppointmentsDataJson};
                    var revenueData = {RevenueDataJson};
                    console.log('Appointments Data:', appointmentsData);
                    console.log('Revenue Data:', revenueData);
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "chartData", script, true);
            }
        }

        private void LoadChartData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;
            Dictionary<string, int> appointmentsData = new Dictionary<string, int>();
            Dictionary<string, decimal> revenueData = new Dictionary<string, decimal>();

            string[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
            foreach (var month in months)
            {
                appointmentsData[month] = 0;
                revenueData[month] = 0;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string queryAppointments = @"
                    SELECT FORMAT(AppointmentDate, 'MMM') AS Month, COUNT(*) AS Total
                    FROM Appointments
                    WHERE YEAR(AppointmentDate) = YEAR(GETDATE())
                    GROUP BY FORMAT(AppointmentDate, 'MMM')
                    ORDER BY MIN(MONTH(AppointmentDate))";

                using (SqlCommand cmd = new SqlCommand(queryAppointments, conn))
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string month = reader["Month"].ToString();
                        int count = Convert.ToInt32(reader["Total"]);
                        if (appointmentsData.ContainsKey(month))
                        {
                            appointmentsData[month] = count;
                        }
                    }
                }

                string queryRevenue = @"
                    SELECT FORMAT(a.AppointmentDate, 'MMM') AS Month, SUM(ad.DesignPrice * ad.Quantity) AS TotalRevenue
                    FROM Appointments a
                    JOIN AppointmentDesigns ad ON a.AppointmentID = ad.AppointmentID
                    WHERE YEAR(a.AppointmentDate) = YEAR(GETDATE())
                    GROUP BY FORMAT(a.AppointmentDate, 'MMM')
                    ORDER BY MIN(MONTH(a.AppointmentDate))";

                using (SqlCommand cmd = new SqlCommand(queryRevenue, conn))
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string month = reader["Month"].ToString();
                        decimal revenue = Convert.ToDecimal(reader["TotalRevenue"]);
                        if (revenueData.ContainsKey(month))
                        {
                            revenueData[month] = revenue;
                        }
                    }
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            AppointmentsDataJson = js.Serialize(appointmentsData);
            RevenueDataJson = js.Serialize(revenueData);
        }
    }
}
