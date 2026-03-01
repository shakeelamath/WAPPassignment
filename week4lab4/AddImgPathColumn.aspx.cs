using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace week4lab4
{
    public partial class AddImgPathColumn : System.Web.UI.Page
    {
        protected Label lblResult;
        protected Button btnAddColumn;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddColumn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                // Check if ImgPath column exists
                SqlCommand checkColumn = new SqlCommand(
                    "SELECT COUNT(*) FROM sys.columns WHERE object_id = OBJECT_ID('userTable') AND name = 'ImgPath'", con);
                int columnExists = (int)checkColumn.ExecuteScalar();

                if (columnExists == 0)
                {
                    // Add the ImgPath column
                    SqlCommand addColumn = new SqlCommand("ALTER TABLE userTable ADD ImgPath NVARCHAR(255) NULL", con);
                    addColumn.ExecuteNonQuery();
                    
                    lblResult.Text = "Success! ImgPath column has been added to userTable.<br/>";
                    lblResult.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblResult.Text = "ImgPath column already exists in userTable.<br/>";
                    lblResult.ForeColor = System.Drawing.Color.Blue;
                }

                // Display current table structure
                lblResult.Text += "<br/><b>Current table columns:</b><br/>";
                SqlCommand getColumns = new SqlCommand(
                    "SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'userTable' ORDER BY ORDINAL_POSITION", con);
                SqlDataReader reader = getColumns.ExecuteReader();
                
                while (reader.Read())
                {
                    lblResult.Text += $"- {reader["COLUMN_NAME"]} ({reader["DATA_TYPE"]})<br/>";
                }
                reader.Close();

                con.Close();

                lblResult.Text += "<br/><b>You can now use the profile picture upload feature! <a href='editUserProfile.aspx'>Go to Profile</a></b>";
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: " + ex.Message;
                lblResult.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
