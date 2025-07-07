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
    public partial class customer1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) // Check if session is empty
            {
                Response.Redirect("Login_form.aspx"); // Redirect to login page
            }
            if (!IsPostBack)
            {
                LoadFeedback();
            }
        }

        private void LoadFeedback()
        {
            string connString = ConfigurationManager.ConnectionStrings["NailTrendZDB"]?.ConnectionString;

            if (string.IsNullOrEmpty(connString))
            {
                throw new Exception("Database connection string 'NailTrendZDB' not found in Web.config.");
            }

            List<FeedbackModel> feedbackList = new List<FeedbackModel>();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT TOP 5 CustomerName, Comments FROM dbo.Feedbacks WHERE Comments IS NOT NULL ORDER BY FeedbackID DESC;";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    feedbackList.Add(new FeedbackModel
                    {
                        CustomerName = reader["CustomerName"].ToString(),
                        Comments = reader["Comments"].ToString()
                    });
                }

                reader.Close();
            }

            if (feedbackList.Count == 0)
            {
                // Default feedback if no feedback is found
                feedbackList.Add(new FeedbackModel { CustomerName = "Radha", Comments = "Amazing service, highly recommend!" });
            }

            rptFeedback.DataSource = feedbackList;
            rptFeedback.DataBind();
        }

        public class FeedbackModel
        {
            public string CustomerName { get; set; }
            public string Comments { get; set; }
        }

        protected void btnAddFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddFeedbackPage.aspx");
        }
    }
}
