using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment.Member
{
    public partial class Discussion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AuthHelper.IsLoggedIn)
            {
                Response.Redirect("~/Account/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Only admins can create new topics or upload documents; members can view and download
                btnNewTopic.Visible = AuthHelper.IsAdmin;
                pnlUpload.Visible = AuthHelper.IsAdmin;

                LoadTopics();
                LoadDocuments();
            }
        }

        private void LoadTopics()
        {
            try
            {
                using (SqlConnection conn = DatabaseHelper.GetConnection())
                {
                    string query = @"SELECT dt.TopicID, dt.Title, dt.Category, dt.Description, 
                                   dt.CreatedDate, dt.Views, dt.IsPinned, u.Username,
                                   (SELECT COUNT(*) FROM DiscussionPosts WHERE TopicID = dt.TopicID) AS PostCount
                                   FROM DiscussionTopics dt
                                   INNER JOIN Users u ON dt.CreatedBy = u.UserID
                                   WHERE dt.IsLocked = 0
                                   ORDER BY dt.IsPinned DESC, dt.CreatedDate DESC";
                    
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    
                    if (reader.HasRows)
                    {
                        rptTopics.DataSource = reader;
                        rptTopics.DataBind();
                        pnlNoTopics.Visible = false;
                    }
                    else
                    {
                        pnlNoTopics.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading topics: " + ex.Message, "danger");
            }
        }

        protected void btnNewTopic_Click(object sender, EventArgs e)
        {
            if (!AuthHelper.IsAdmin)
            {
                ShowMessage("Only administrators can create new topics.", "warning");
                return;
            }

            pnlNewTopic.Visible = true;
        }

        protected void btnCancelTopic_Click(object sender, EventArgs e)
        {
            pnlNewTopic.Visible = false;
            ClearForm();
        }

        protected void btnSubmitTopic_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (!AuthHelper.IsAdmin)
                {
                    ShowMessage("Only administrators can create topics.", "warning");
                    return;
                }
                try
                {
                    using (SqlConnection conn = DatabaseHelper.GetConnection())
                    {
                        int userId = GetUserId(conn);

                        string query = @"INSERT INTO DiscussionTopics (Title, Category, Description, CreatedBy, CreatedDate, Views, IsLocked, IsPinned) 
                                       VALUES (@Title, @Category, @Description, @CreatedBy, @CreatedDate, 0, 0, 0)";
                        
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@Title", txtTopicTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                        cmd.Parameters.AddWithValue("@Description", txtTopicDescription.Text.Trim());
                        cmd.Parameters.AddWithValue("@CreatedBy", userId);
                        cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                        conn.Open();
                        cmd.ExecuteNonQuery();

                        ShowMessage("Topic created successfully!", "success");
                        ClearForm();
                        pnlNewTopic.Visible = false;
                        LoadTopics();
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("Error creating topic: " + ex.Message, "danger");
                }
            }
        }

        protected void btnUploadDoc_Click(object sender, EventArgs e)
        {
            if (!AuthHelper.IsAdmin)
            {
                ShowMessage("Only administrators can upload documents.", "warning");
                return;
            }

            try
            {
                if (fuDocument.HasFile)
                {
                    string uploadsDir = Server.MapPath("~/Uploads/Discussion");
                    if (!System.IO.Directory.Exists(uploadsDir))
                        System.IO.Directory.CreateDirectory(uploadsDir);

                    string fn = System.IO.Path.GetFileName(fuDocument.FileName);
                    string uniqueName = DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + fn;
                    string savePath = System.IO.Path.Combine(uploadsDir, uniqueName);

                    fuDocument.SaveAs(savePath);
                    ShowMessage("Document uploaded successfully.", "success");
                    LoadDocuments();
                }
                else
                {
                    ShowMessage("Please select a file to upload.", "warning");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error uploading document: " + ex.Message, "danger");
            }
        }

        private void LoadDocuments()
        {
            try
            {
                string uploadsDir = Server.MapPath("~/Uploads/Discussion");
                if (!System.IO.Directory.Exists(uploadsDir))
                {
                    rptDocuments.DataSource = null;
                    rptDocuments.DataBind();
                    return;
                }

                var files = System.IO.Directory.GetFiles(uploadsDir);
                var list = new System.Collections.Generic.List<System.Dynamic.ExpandoObject>();
                foreach (var f in files)
                {
                    dynamic item = new System.Dynamic.ExpandoObject();
                    item.FileName = System.IO.Path.GetFileName(f);
                    item.Url = ResolveUrl("~/Uploads/Discussion/" + item.FileName);
                    list.Add(item);
                }

                rptDocuments.DataSource = list;
                rptDocuments.DataBind();
            }
            catch { }
        }

        private void ClearForm()
        {
            txtTopicTitle.Text = string.Empty;
            txtTopicDescription.Text = string.Empty;
            ddlCategory.SelectedIndex = 0;
        }

        private void ShowMessage(string message, string type)
        {
            pnlMessage.Visible = true;
            pnlMessage.CssClass = $"alert alert-{type}";
            lblMessage.Text = message;
        }

        private int GetUserId(SqlConnection conn)
        {
            string query = "SELECT UserID FROM Users WHERE Username = @Username";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", AuthHelper.CurrentUsername);
            
            if (conn.State != ConnectionState.Open)
                conn.Open();

            return (int)cmd.ExecuteScalar();
        }
    }
}
