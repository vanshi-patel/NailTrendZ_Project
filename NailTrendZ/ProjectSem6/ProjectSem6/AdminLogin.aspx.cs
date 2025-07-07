using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        // Static credentials (Replace with database authentication later)
        private const string AdminUsername = "admin";
        private const string AdminPassword = "admin123";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear any previous session on page load
            if (!IsPostBack)
            {
                Session["AdminUser"] = null;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (username == AdminUsername && password == AdminPassword)
            {
                // Store username in session for authentication
                Session["AdminUser"] = username;

                // Redirect to Admin Dashboard
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Username or Password!";
                lblMessage.CssClass = "alert alert-danger";
                lblMessage.Style["display"] = "block";
            }
        }
    }
}
