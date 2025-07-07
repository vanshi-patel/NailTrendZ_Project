using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectSem6.Models;

namespace ProjectSem6
{
    public partial class Bag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) // Check if session is empty
            {
                Response.Redirect("Login_form.aspx"); // Redirect to login page
            }
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            List<Product> cart = Session["Cart"] as List<Product> ?? new List<Product>();
            if (cart.Count == 0)
            {
                lblMessage.Text = "Your Bag is empty!";
            }
            else
            {
                RepeaterCart.DataSource = cart;
                RepeaterCart.DataBind();
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string productId = btn.CommandArgument;

            List<Product> cart = Session["Cart"] as List<Product> ?? new List<Product>();
            cart.RemoveAll(p => p.Id == productId);

            // If the cart is empty after removal, set Session["Cart"] to null and redirect
            if (cart.Count == 0)
            {
                Session["Cart"] = null;
                Response.Redirect("index.aspx"); // Redirect to index.aspx when last item is removed
            }
            else
            {
                Session["Cart"] = cart;
                LoadCart();  // Refresh the UI
            }

            /*Session["Cart"] = cart;
            LoadCart();*/
        }
        

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            // Redirect to checkout page (modify the URL if needed)
            Response.Redirect("Appointments.aspx");
        }

    }
}
