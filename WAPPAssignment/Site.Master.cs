using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WAPPAssignment.Helpers;

namespace WAPPAssignment
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConfigureNavigation();
            }
        }

        private void ConfigureNavigation()
        {
            if (AuthHelper.IsLoggedIn)
            {
                // Hide guest navigation links
                navSolarSystem.Visible = false;
                // other guest links removed
                
                // Hide guest auth links (Login and Register)
                navLogin.Visible = false;
                navRegister.Visible = false;

                // Show logged-in user info
                navUserInfo.Visible = true;
                navLogout.Visible = true;
                lblUsername.Text = AuthHelper.CurrentUsername;

                if (AuthHelper.IsAdmin)
                {
                    // Show admin navigation
                    navAdminDashboard.Visible = true;
                    navManageContent.Visible = true;
                    navManageUsers.Visible = true;
                    
                    // Hide member navigation
                    navMemberDashboard.Visible = false;
                    navMemberSolarSystem.Visible = false;
                    navQuizzes.Visible = false;
                    navDiscussion.Visible = false;
                }
                else if (AuthHelper.IsMember)
                {
                    // Show member navigation
                    navMemberDashboard.Visible = true;
                    navMemberSolarSystem.Visible = true;
                    navQuizzes.Visible = true;
                    navDiscussion.Visible = true;
                    
                    // Hide admin navigation
                    navAdminDashboard.Visible = false;
                    navManageContent.Visible = false;
                    navManageUsers.Visible = false;
                }
            }
            else
            {
                // Show guest navigation
                navSolarSystem.Visible = true;
                // other guest links removed
                
                // Show guest auth links
                navLogin.Visible = true;
                navRegister.Visible = true;
                
                // Hide logged-in user info
                navUserInfo.Visible = false;
                navLogout.Visible = false;
                
                // Hide member navigation
                navMemberDashboard.Visible = false;
                navMemberSolarSystem.Visible = false;
                navQuizzes.Visible = false;
                navDiscussion.Visible = false;
                
                // Hide admin navigation
                navAdminDashboard.Visible = false;
                navManageContent.Visible = false;
                navManageUsers.Visible = false;
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            AuthHelper.Logout();
            Response.Redirect("~/Default.aspx");
        }
    }
}
