using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class AdminLogout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session and redirect to login page
            Session.Clear();
            Session.Abandon();
            Response.Redirect("AdminLogin.aspx");
        }
    }
}