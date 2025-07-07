using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session and authentication cookie
            Session.Clear();
            Session.Abandon();

            // Remove authentication cookie if exists
            if (Request.Cookies["AuthCookie"] != null)
            {
                HttpCookie authCookie = new HttpCookie("AuthCookie");
                authCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(authCookie);
            }

            // Redirect to login page
            Response.Redirect("Login_form.aspx");
        }
    }
}