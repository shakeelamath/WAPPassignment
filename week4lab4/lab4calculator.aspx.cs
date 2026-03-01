using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace week4lab4
{
    public partial class lab4calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            double result = 0.0;
            result = Convert.ToDouble(TextBox1.Text) + Convert.ToDouble(TextBox2.Text);
            Label4.Text ="The result is" + result.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            double result = 0.0;
            result = Convert.ToDouble(TextBox1.Text) - Convert.ToDouble(TextBox2.Text);
            Label4.Text = "The result is" + result.ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            double result = 0.0;
            result = Convert.ToDouble(TextBox1.Text) * Convert.ToDouble(TextBox2.Text);
            Label4.Text = "The result is" + result.ToString();
        }
    }
}