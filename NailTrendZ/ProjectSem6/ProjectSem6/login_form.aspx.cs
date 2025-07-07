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
    public partial class login_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is already logged in
                if (Session["Username"] != null)
                {
                    Response.Redirect("dashboard.aspx"); // Redirect to dashboard if session exists
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both username and password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Hash the entered password to compare with database-stored password
            string hashedPassword = GetHashedPassword(password);

            string connString = ConfigurationManager.ConnectionStrings["NailTrendZDB"]?.ConnectionString;
            if (string.IsNullOrEmpty(connString))
            {
                lblMessage.Text = "Database connection error.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT UserID, UserName FROM dbo.Users WHERE UserName = @UserName AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserName", username);
                cmd.Parameters.AddWithValue("@Password", hashedPassword);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        // Store session variables
                        Session["UserID"] = reader["UserID"].ToString();
                        Session["Username"] = reader["UserName"].ToString();

                        // Redirect to index page after successful login
                        Response.Redirect("index.aspx"); // Redirect to index.aspx
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }


        // Helper method to hash the password (must match registration hashing)
        private string GetHashedPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(hashBytes);
            }
        }
    }
}