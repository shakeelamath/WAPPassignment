using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.UI.HtmlControls;

namespace week4lab4
{
    public partial class manageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Temporarily bypass for testing - set a default usertype
            if (Session["firstName"] != null && Session["usertype"] != null)
            {
                svfname.Text = "Hi, " + Session["firstName"].ToString();
                usertype.Text = Session["usertype"].ToString();
            }
            else
            {
                // For testing only - comment this out when done
                svfname.Text = "Hi, Guest (Testing Mode)";
                usertype.Text = "admin"; // Set to "admin" or "member" for testing
                // Response.Redirect("login.aspx"); // Uncomment this line when testing is done
            }

            if (!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                
                // Query to get all users with the same usertype, or all users if admin
                string query = "";
                if (usertype.Text.ToLower() == "admin")
                {
                    // Admin can see all users (both admin and member)
                    query = "select * from userTable";
                }
                else
                {
                    // Members can only see users of their own type
                    query = "select * from userTable where usertype = '" + usertype.Text + "'";
                }
                
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                uname.DataSource = dt;
                uname.DataTextField = "username";
                uname.DataValueField = "username";
                DataBind();
                
                con.Close();
            }
        }

        protected void uname_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("select * from userTable where username = '"
                                        + uname.SelectedValue + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    fname.Text = dt.Rows[0]["fname"].ToString();
                    lname.Text = dt.Rows[0]["lname"].ToString();
                    
                    // Safely set gender value - only if it exists in the list
                    string genderValue = dt.Rows[0]["gender"].ToString();
                    if (gender.Items.FindByValue(genderValue) != null)
                    {
                        gender.SelectedValue = genderValue;
                    }
                    else
                    {
                        gender.SelectedIndex = 0; // Default to first item
                    }
                    
                    country.Text = dt.Rows[0]["country"].ToString();
                    email.Text = dt.Rows[0]["email"].ToString();
                    pwd.Text = dt.Rows[0]["password"].ToString();
                }

                con.Close();
            }
            catch (Exception ex)
            {
                errMsg.Text = "Error loading user data: " + ex.Message;
                errMsg.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "update userTable set fname ='" + fname.Text + "',lname ='" + lname.Text
                    + "',gender ='" + gender.SelectedValue + "',country ='" + country.Text
                    + "',email ='" + email.Text + "',password ='" + pwd.Text
                    + "' where username = '" + uname.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                con.Close();
                
                errMsg.Text = "User updated successfully!";
                errMsg.ForeColor = System.Drawing.Color.Green;
                errMsg.Visible = true;
            }
            catch (Exception ex)
            {
                errMsg.Text = "Error updating user: " + ex.Message;
                errMsg.ForeColor = System.Drawing.Color.Red;
                errMsg.Visible = true;
            }
        }

        protected void gender_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListItem li = new ListItem();
            li.Text = "F";
            li.Value = "F";
            gender.Items.Add(li);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "delete from userTable where username = '" + uname.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Redirect("manageUser.aspx");
            }
            catch (Exception ex)
            {
                errMsg.Text = "Error deleting user: " + ex.Message;
                errMsg.ForeColor = System.Drawing.Color.Red;
                errMsg.Visible = true;
            }
        }
    }
}
