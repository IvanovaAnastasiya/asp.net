using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CookieExchange
{
    public partial class LiginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["redirect"] == "1")
            {
                this.IsRedirected.Text = "You have been redirected here to login";
            }
            else
            {
                this.IsRedirected.Text = "Please login";
            }
        }

        protected void LogIn_Click(object sender, EventArgs e)
        {
            var cookie = new HttpCookie("login-cookie", "loggedIn");
            cookie.Expires = DateTime.Now.AddMinutes(10);
            cookie.HttpOnly = true;
            Response.Cookies.Add(cookie);
            Response.Redirect("Home.aspx");
        }
    }
}