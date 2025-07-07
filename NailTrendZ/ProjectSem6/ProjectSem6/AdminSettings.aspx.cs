using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class AdminSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 🚨 Redirect to login if session is missing
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
    }
}