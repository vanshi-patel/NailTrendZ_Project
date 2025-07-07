using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectSem6.Models; // Use existing Product class

namespace ProjectSem6
{
    public partial class moreproducts1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null) // Check if session is empty
            {
                Response.Redirect("Login_form.aspx"); // Redirect to login page
            }
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            Repeater1.DataSource = GetProducts();
            Repeater1.DataBind();
        }

        private List<Product> GetProducts()
        {
            List<Product> products = new List<Product>();

            // Replace with your actual database connection string
            string connectionString = ConfigurationManager.ConnectionStrings["NailTrendZDB"]?.ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT DesignID, ImageURL, Price FROM Designs";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            products.Add(new Product
                            {
                                Id = reader["DesignID"].ToString(),
                                ImageURL = reader["ImageURL"].ToString(),
                                Price = Convert.ToDecimal(reader["Price"])
                            });
                        }
                    }
                }
            }

            return products;
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            HiddenField hfProductID = (HiddenField)item.FindControl("hfProductID");
            HiddenField hfImageURL = (HiddenField)item.FindControl("hfImageURL");
            HiddenField hfPrice = (HiddenField)item.FindControl("hfPrice");

            string productId = hfProductID.Value;
            string imageUrl = hfImageURL.Value;
            decimal price = Convert.ToDecimal(hfPrice.Value);

            List<Product> cart = Session["Cart"] as List<Product> ?? new List<Product>();

            if (!cart.Exists(p => p.Id == productId))
            {
                cart.Add(new Product { Id = productId, ImageURL = imageUrl, Price = price });
                Session["Cart"] = cart;
            }

            Response.Redirect("Bag.aspx");
        }
    }
}
