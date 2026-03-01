using System;
using System.Web.UI;
using WAPPAssignment.Helpers;

namespace WAPPAssignment.Admin
{
    public partial class ManageContent : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!AuthHelper.IsAdmin)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}
