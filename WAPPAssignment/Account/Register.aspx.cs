using System;
using System.Data.SqlClient;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment.Account
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (AuthHelper.IsLoggedIn)
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string fullName = txtFullName.Text.Trim();
                string username = txtUsername.Text.Trim();
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text;

                // Check if username or email already exists
                if (UserExists(username, email))
                {
                    ShowMessage("Username or email already exists. Please choose another.", "danger");
                    return;
                }

                // Register the user
                // If there are no admins yet in the database, make the first registered user an Admin
                string role = AdminExists() ? "Member" : "Admin";

                if (RegisterUser(fullName, username, email, password, role))
                {
                    ShowMessage("Registration successful! Redirecting to login...", "success");
                    
                    // Redirect to login after 2 seconds
                    Response.AddHeader("REFRESH", "2;URL=Login.aspx");
                }
                else
                {
                    ShowMessage("Registration failed. Please try again.", "danger");
                }
            }
        }

        private bool AdminExists()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = "SELECT COUNT(*) FROM Users WHERE Role = 'Admin'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch
            {
                // If there is a database error, assume an admin exists to avoid unintentionally creating an admin
                return true;
            }
        }

        private bool UserExists(string username, string email)
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username OR Email = @Email";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Email", email);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Database error: " + ex.Message, "danger");
                return true; // Assume exists to prevent registration
            }
        }

        private bool RegisterUser(string fullName, string username, string email, string password, string role)
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = @"INSERT INTO Users (Username, Email, Password, FullName, Role, DateRegistered, IsActive) 
                                   VALUES (@Username, @Email, @Password, @FullName, @Role, @DateRegistered, 1)";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); // In production, hash the password
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@DateRegistered", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Role", role);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Registration error: " + ex.Message, "danger");
                return false;
            }
        }

        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            pnlMessage.CssClass = $"alert alert-{type}";
            lblMessage.Text = message;
        }
    }
}
