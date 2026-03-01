using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using WAPPAssignment.Helpers;

namespace WAPPAssignment.Admin
{
    public partial class ManageUsers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AuthHelper.IsAdmin)
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUsers();
                LoadStatistics();
            }
        }

        private void LoadUsers(string searchTerm = "")
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = @"SELECT UserID, Username, FullName, Email, Role, IsActive, 
                                   DateRegistered, LastLogin 
                                   FROM Users 
                                   WHERE Role != 'Admin'";
                    
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        query += " AND (Username LIKE @Search OR FullName LIKE @Search OR Email LIKE @Search)";
                    }
                    
                    query += " ORDER BY DateRegistered DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@Search", "%" + searchTerm + "%");
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvUsers.DataSource = dt;
                    gvUsers.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading users: " + ex.Message, "danger");
            }
        }

        private void LoadStatistics()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    conn.Open();

                    // Total users
                    string totalQuery = "SELECT COUNT(*) FROM Users WHERE Role != 'Admin'";
                    SqlCommand cmd = new SqlCommand(totalQuery, conn);
                    lblTotalUsers.Text = cmd.ExecuteScalar().ToString();

                    // Active users
                    string activeQuery = "SELECT COUNT(*) FROM Users WHERE Role != 'Admin' AND IsActive = 1";
                    cmd = new SqlCommand(activeQuery, conn);
                    lblActiveUsers.Text = cmd.ExecuteScalar().ToString();

                    // New this month
                    string newQuery = @"SELECT COUNT(*) FROM Users 
                                      WHERE Role != 'Admin' 
                                      AND MONTH(DateRegistered) = MONTH(GETDATE()) 
                                      AND YEAR(DateRegistered) = YEAR(GETDATE())";
                    cmd = new SqlCommand(newQuery, conn);
                    lblNewUsers.Text = cmd.ExecuteScalar().ToString();
                }
            }
            catch { }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadUsers(txtSearch.Text.Trim());
        }

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            LoadUsers();
        }

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            LoadUsers();
        }

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvUsers.Rows[e.RowIndex];

                DropDownList ddlRole = (DropDownList)row.FindControl("ddlRole");
                CheckBox chkIsActive = (CheckBox)row.FindControl("chkIsActive");

                string role = ddlRole.SelectedValue;
                bool isActive = chkIsActive.Checked;

                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = "UPDATE Users SET Role = @Role, IsActive = @IsActive WHERE UserID = @UserID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Role", role);
                    cmd.Parameters.AddWithValue("@IsActive", isActive);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                gvUsers.EditIndex = -1;
                LoadUsers();
                LoadStatistics();
                ShowMessage("User updated successfully!", "success");
            }
            catch (Exception ex)
            {
                ShowMessage("Error updating user: " + ex.Message, "danger");
            }
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    // Instead of deleting, we'll deactivate the user
                    string query = "UPDATE Users SET IsActive = 0 WHERE UserID = @UserID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                LoadUsers();
                LoadStatistics();
                ShowMessage("User deactivated successfully!", "warning");
            }
            catch (Exception ex)
            {
                ShowMessage("Error deleting user: " + ex.Message, "danger");
            }
        }

        protected string GetRoleBadgeClass(string role)
        {
            return role == "Admin" ? "badge bg-danger" : "badge bg-primary";
        }

        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            pnlMessage.CssClass = $"alert alert-{type}";
            lblMessage.Text = message;
        }
    }
}
