using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class AdminDesigns : System.Web.UI.Page
    {
        private AdminDesignsRepository designsRepo = new AdminDesignsRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🚨 Redirect to login if session is missing
            if (Session["AdminUser"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadDesigns();
            }
        }

        private void LoadDesigns()
        {
            gvDesigns.DataSource = designsRepo.GetAllDesigns();
            gvDesigns.DataBind();
        }

        protected void gvDesigns_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDesigns.EditIndex = e.NewEditIndex;
            LoadDesigns();
        }

        protected void gvDesigns_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDesigns.Rows[e.RowIndex];
            int designID = Convert.ToInt32(gvDesigns.DataKeys[e.RowIndex].Value);


            decimal price = Convert.ToDecimal((row.FindControl("txtPrice") as TextBox).Text);

            FileUpload fileUpload = row.FindControl("fuImageUpload") as FileUpload;
            HiddenField hfImageURL = row.FindControl("hfImageURL") as HiddenField;

            string imageURL = hfImageURL.Value; // Default to existing image

            // If a new image is uploaded, save it and update the URL
            if (fileUpload.HasFile)
            {
                string fileName = System.IO.Path.GetFileName(fileUpload.FileName);
                string filePath = "designsPics/" + fileName; // Assuming "Images" folder in project
                fileUpload.SaveAs(Server.MapPath(filePath));
                imageURL = filePath;
            }

            designsRepo.UpdateDesign(designID, price, imageURL);
            gvDesigns.EditIndex = -1;
            LoadDesigns();
        }


        protected void gvDesigns_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDesigns.EditIndex = -1;
            LoadDesigns();
        }

        protected void gvDesigns_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int designID = Convert.ToInt32(gvDesigns.DataKeys[e.RowIndex].Value);
            designsRepo.DeleteDesign(designID);
            LoadDesigns();
        }

        protected void btnAddDesign_Click(object sender, EventArgs e)
        {


            // Validate and parse price as an integer
            int price;
            if (!int.TryParse(txtNewPrice.Text, out price))
            {
                // Show error message in an alert box
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Please enter a valid whole number for the price.');", true);
                return;
            }

            string imageURL = "designsPics/default.png"; // Default image if no file is uploaded

            // Check if a file is uploaded
            if (fuNewImageUpload.HasFile)
            {
                string fileName = System.IO.Path.GetFileName(fuNewImageUpload.FileName);
                string filePath = "designsPics/" + fileName;
                fuNewImageUpload.SaveAs(Server.MapPath(filePath));
                imageURL = filePath; // Use the uploaded file path
            }

            designsRepo.AddDesign(price, imageURL); // Call repository method with integer price
            LoadDesigns();

            // Clear input fields after successful addition

            txtNewPrice.Text = "";

            // Show success message in an alert box
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Design added successfully!');", true);
        }


    }
}
