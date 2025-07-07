using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectSem6
{
    public partial class registration_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization can go here if needed
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Retrieve input values from the form
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Validate the form fields
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                ShowAlert("All fields are required.", "error");
                return;
            }

            // Check if passwords match
            if (password != confirmPassword)
            {
                ShowAlert("Passwords do not match.", "error");
                return;
            }

            // Hash the password
            string hashedPassword = GetHashedPassword(password);

            // Get the database connection string
            string connString = ConfigurationManager.ConnectionStrings["NailTrendZDB"]?.ConnectionString;

            if (string.IsNullOrEmpty(connString))
            {
                ShowAlert("Database connection string not found.", "error");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                // Check if username exists
                string checkUsernameQuery = "SELECT COUNT(*) FROM dbo.Users WHERE UserName = @UserName";
                using (SqlCommand checkUserCmd = new SqlCommand(checkUsernameQuery, conn))
                {
                    checkUserCmd.Parameters.AddWithValue("@UserName", username);
                    int usernameCount = (int)checkUserCmd.ExecuteScalar();

                    if (usernameCount > 0)
                    {
                        ShowAlert("Username already taken! Please choose a different one.", "warning");
                        return;
                    }
                }

                // Check if email exists
                string checkEmailQuery = "SELECT COUNT(*) FROM dbo.Users WHERE Email = @Email";
                using (SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, conn))
                {
                    checkEmailCmd.Parameters.AddWithValue("@Email", email);
                    int emailCount = (int)checkEmailCmd.ExecuteScalar();

                    if (emailCount > 0)
                    {
                        ShowAlert("Email already registered! Please use a different email or log in.", "warning");
                        return;
                    }
                }

                // Insert new user
                string insertQuery = "INSERT INTO dbo.Users (UserName, Email, Password, CreatedAt) VALUES (@UserName, @Email, @Password, GETDATE())";
                using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                {
                    insertCmd.Parameters.AddWithValue("@UserName", username);
                    insertCmd.Parameters.AddWithValue("@Email", email);
                    insertCmd.Parameters.AddWithValue("@Password", hashedPassword);

                    try
                    {
                        insertCmd.ExecuteNonQuery();
                        ShowAlert("Registration successful! Redirecting to login...", "success");
                        Response.Redirect("login_form.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    catch (Exception ex)
                    {
                        ShowAlert("Error: " + ex.Message, "error");
                    }
                }
            }
        }

        // Helper method to hash the password
        private string GetHashedPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(hashBytes);
            }
        }

        // Helper method to show alert box
        private void ShowAlert(string message, string type)
        {
            string script = $"alert('{message}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", script, true);
        }
    }
}
