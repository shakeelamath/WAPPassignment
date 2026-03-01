using System;
using System.Data.SqlClient;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment.Account
{
    public partial class Login : Page
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text;

                if (ValidateUser(username, password))
                {
                    string role = GetUserRole(username);
                    AuthHelper.Login(username, role, chkRememberMe.Checked);

                    // Update last login
                    UpdateLastLogin(username);

                    // Redirect based on role
                    Response.Redirect(AuthHelper.GetRedirectUrl(role));
                }
                else
                {
                    ShowMessage("Invalid username or password. Please try again.");
                }
            }
        }

        private bool ValidateUser(string username, string password)
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password AND IsActive = 1";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password); // In production, use hashed passwords

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Database error: " + ex.Message);
                return false;
            }
        }

        private string GetUserRole(string username)
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = "SELECT Role FROM Users WHERE Username = @Username";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Username", username);

                    conn.Open();
                    return cmd.ExecuteScalar()?.ToString() ?? "Member";
                }
            }
            catch
            {
                return "Member";
            }
        }

        private void UpdateLastLogin(string username)
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = "UPDATE Users SET LastLogin = @LastLogin WHERE Username = @Username";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@LastLogin", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Username", username);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch { }
        }

        private void ShowMessage(string message)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;
        }
    }
}
