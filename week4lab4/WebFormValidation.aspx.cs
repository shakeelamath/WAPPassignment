using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace week4lab4
{
    public partial class WebFormValidation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // 1. Define the file path
            // Server.MapPath gets the physical location of your project folder
            string filePath = Server.MapPath("~/members.txt");

            // 2. Get the values from your form controls
            string fName = TextBox1.Text;
            string lName = TextBox2.Text;

            // Assuming you added a DropDownList for gender. 
            // If you used a TextBox instead, change this to that TextBox name.
            string gender = ListBox1.SelectedValue;

            string email = TextBox3.Text;
            string userId = TextBox4.Text;
            string password = TextBox5.Text;

            // 3. Format the data as a CSV string (Comma Separated Values)
            // Format: FirstName,LastName,Gender,Email,ID,Password
            string newDataLine = $"{fName},{lName},{gender},{email},{userId},{password}";

            // 4. Check if the file exists to decide if we need a Header row
            if (!File.Exists(filePath))
            {
                // Create file and write Header + First Data Line
                string header = "FirstName,LastName,Gender,Email,ID,Password";
                File.WriteAllText(filePath, header + Environment.NewLine + newDataLine + Environment.NewLine);
            }
            else
            {
                // File exists, just append the new line
                File.AppendAllText(filePath, newDataLine + Environment.NewLine);
            }

            // Optional: Clear the boxes after saving
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 8 || args.Value.Length > 100)
                args.IsValid = false;
            else
                args.IsValid = true;

        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length < 6 || args.Value.Length > 100)
                args.IsValid = false;
            else
                args.IsValid = true;

        }
    }
}