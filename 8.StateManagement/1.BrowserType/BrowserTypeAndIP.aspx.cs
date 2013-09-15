using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _1.BrowserType
{
    public partial class BrowserTypeAndIP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var msg = new StringBuilder();
            msg.Append("Browser: " + Request.Browser.Browser + ", ");
            msg.Append("Address: " + Request.UserHostAddress+"(" + Request.UserHostName + ")" + Request.UrlReferrer);

            this.Result.InnerText = msg.ToString();
        }
    }
}