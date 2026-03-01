using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace week4lab4
{
    public partial class InitializeDatabase : System.Web.UI.Page
    {
        protected Label lblResult;
        protected Button btnInitialize;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnInitialize_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                // Check if table exists
                SqlCommand checkTable = new SqlCommand(
                    "IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'userTable') SELECT 0 ELSE SELECT 1", con);
                int tableExists = (int)checkTable.ExecuteScalar();

                if (tableExists == 0)
                {
                    // Create userTable
                    string createTableQuery = @"
                        CREATE TABLE [dbo].[userTable] (
                            [id] INT IDENTITY(1,1) PRIMARY KEY,
                            [username] NVARCHAR(50) NOT NULL UNIQUE,
                            [fname] NVARCHAR(100) NOT NULL,
                            [lname] NVARCHAR(100) NOT NULL,
                            [gender] NCHAR(1) NOT NULL CHECK (gender IN ('F', 'M')),
                            [country] NVARCHAR(100) NULL,
                            [email] NVARCHAR(100) NULL,
                            [password] NVARCHAR(100) NOT NULL,
                            [usertype] NVARCHAR(20) NOT NULL CHECK (usertype IN ('admin', 'member')),
                            [ImgPath] NVARCHAR(255) NULL,
                            [created_date] DATETIME DEFAULT GETDATE()
                        );";

                    SqlCommand createCmd = new SqlCommand(createTableQuery, con);
                    createCmd.ExecuteNonQuery();

                    lblResult.Text = "Table created successfully!<br/>";
                    lblResult.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblResult.Text = "Table already exists!<br/>";
                    lblResult.ForeColor = System.Drawing.Color.Blue;
                    
                    // Check if ImgPath column exists, if not add it
                    SqlCommand checkColumn = new SqlCommand("SELECT COUNT(*) FROM sys.columns WHERE object_id = OBJECT_ID('userTable') AND name = 'ImgPath'", con);
                    int columnExists = (int)checkColumn.ExecuteScalar();
                    
                    if (columnExists == 0)
                    {
                        SqlCommand addColumn = new SqlCommand("ALTER TABLE userTable ADD ImgPath NVARCHAR(255) NULL", con);
                        addColumn.ExecuteNonQuery();
                        lblResult.Text += "ImgPath column added!<br/>";
                    }
                }

                // Check and insert admin user
                SqlCommand checkAdmin = new SqlCommand("SELECT COUNT(*) FROM userTable WHERE username = 'admin'", con);
                int adminExists = (int)checkAdmin.ExecuteScalar();

                if (adminExists == 0)
                {
                    string insertAdmin = @"INSERT INTO userTable (username, fname, lname, gender, country, email, password, usertype)
                                          VALUES ('admin', 'Admin', 'User', 'M', 'USA', 'admin@example.com', 'admin123', 'admin')";
                    SqlCommand cmdAdmin = new SqlCommand(insertAdmin, con);
                    cmdAdmin.ExecuteNonQuery();
                    lblResult.Text += "Admin user created (username: admin, password: admin123)<br/>";
                }
                else
                {
                    lblResult.Text += "Admin user already exists<br/>";
                }

                // Check and insert member user
                SqlCommand checkMember = new SqlCommand("SELECT COUNT(*) FROM userTable WHERE username = 'member'", con);
                int memberExists = (int)checkMember.ExecuteScalar();

                if (memberExists == 0)
                {
                    string insertMember = @"INSERT INTO userTable (username, fname, lname, gender, country, email, password, usertype)
                                           VALUES ('member', 'John', 'Doe', 'M', 'Canada', 'john@example.com', 'member123', 'member')";
                    SqlCommand cmdMember = new SqlCommand(insertMember, con);
                    cmdMember.ExecuteNonQuery();
                    lblResult.Text += "Member user created (username: member, password: member123)<br/>";
                }
                else
                {
                    lblResult.Text += "Member user already exists<br/>";
                }

                // Display all users
                lblResult.Text += "<br/><b>All users in database:</b><br/>";
                SqlCommand getAllUsers = new SqlCommand("SELECT username, fname, lname, usertype FROM userTable", con);
                SqlDataReader reader = getAllUsers.ExecuteReader();
                
                while (reader.Read())
                {
                    lblResult.Text += $"- {reader["username"]} ({reader["fname"]} {reader["lname"]}) - Type: {reader["usertype"]}<br/>";
                }
                reader.Close();

                con.Close();

                lblResult.Text += "<br/><b>Database is ready! You can now <a href='login.aspx'>login</a> or <a href='register.aspx'>register</a>.</b>";
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: " + ex.Message;
                lblResult.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
