using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class AdminFeedbacks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 🚨 Redirect to login if session is missing
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadFeedbacks();
            }
        }

        private void LoadFeedbacks()
        {
            string connStr = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT FeedbackID, UserID, CustomerName, Comments, CreatedAt FROM Feedbacks";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewFeedbacks.DataSource = dt;
                GridViewFeedbacks.DataBind();
            }
        }

        protected void GridViewFeedbacks_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int feedbackID = Convert.ToInt32(GridViewFeedbacks.DataKeys[e.RowIndex].Value);

            string connStr = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "DELETE FROM Feedbacks WHERE FeedbackID = @FeedbackID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FeedbackID", feedbackID);
                    cmd.ExecuteNonQuery();
                }
            }

            // Reload feedback list
            LoadFeedbacks();
        }
        protected void GridViewFeedbacks_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Example: Get selected row data
            int feedbackID = Convert.ToInt32(GridViewFeedbacks.SelectedDataKey.Value);
            Response.Write("Selected Feedback ID: " + feedbackID);
        }

    }
}
