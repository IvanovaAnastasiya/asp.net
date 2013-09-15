using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CookieExchange
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var cookie = Request.Cookies["login-cookie"];
            if (cookie == null || cookie.Value != "loggedIn")
            {
                Response.Redirect("LoginForm.aspx?redirect=1");
            }
            else
            {
                this.IsUserLoggedLabel.Text = "You are logged in!";
            }
        }
    }
}