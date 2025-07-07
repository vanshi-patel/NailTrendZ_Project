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
    public partial class AdminUsers : System.Web.UI.Page
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
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            string connStr = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT UserID, UserName, Email, CreatedAt FROM Users", conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridViewUsers.DataSource = dt;
                        GridViewUsers.DataBind();
                    }
                }
            }
        }

        protected void GridViewUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userID = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value);
            string connStr = ConfigurationManager.ConnectionStrings["NailTrendZDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE UserID = @UserID", conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadUsers(); // Refresh the grid after deletion
        }
    }
}
