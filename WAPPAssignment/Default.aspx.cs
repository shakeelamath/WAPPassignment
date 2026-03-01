using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WAPPAssignment.Helpers;

namespace WAPPAssignment
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (AuthHelper.IsLoggedIn)
                {
                    GuestPanel.Visible = false;
                    MemberPanel.Visible = true;
                    lblWelcome.Text = AuthHelper.CurrentUsername;
                }
                else
                {
                    GuestPanel.Visible = true;
                    MemberPanel.Visible = false;
                }
            }
        }
    }
}
