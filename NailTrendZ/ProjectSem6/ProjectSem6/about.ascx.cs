using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class about1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) // Check if session is empty
            {
                Response.Redirect("Login_form.aspx"); // Redirect to login page
            }

        }
    }
}