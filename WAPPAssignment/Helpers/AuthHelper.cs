using System;
using System.Web;
using System.Web.Security;

namespace WAPPAssignment.Helpers
{
    public class AuthHelper
    {
        public static bool IsLoggedIn
        {
            get
            {
                return HttpContext.Current.User.Identity.IsAuthenticated;
            }
        }

        public static string CurrentUsername
        {
            get
            {
                return IsLoggedIn ? HttpContext.Current.User.Identity.Name : string.Empty;
            }
        }

        public static bool IsAdmin
        {
            get
            {
                return IsLoggedIn && HttpContext.Current.User.IsInRole("Admin");
            }
        }

        public static bool IsMember
        {
            get
            {
                return IsLoggedIn && (HttpContext.Current.User.IsInRole("Member") || IsAdmin);
            }
        }

        public static void Login(string username, string role, bool rememberMe = false)
        {
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1,
                username,
                DateTime.Now,
                DateTime.Now.AddMinutes(30),
                rememberMe,
                role,
                FormsAuthentication.FormsCookiePath);

            string encryptedTicket = FormsAuthentication.Encrypt(ticket);
            HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
            
            if (rememberMe)
            {
                authCookie.Expires = ticket.Expiration;
            }

            HttpContext.Current.Response.Cookies.Add(authCookie);
        }

        public static void Logout()
        {
            FormsAuthentication.SignOut();
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
        }

        public static string GetRedirectUrl(string role)
        {
            switch (role)
            {
                case "Admin":
                    return "~/Admin/Dashboard.aspx";
                case "Member":
                    return "~/Member/Dashboard.aspx";
                default:
                    return "~/Default.aspx";
            }
        }
    }
}
