using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MenuControl
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.MenuControl.Items = new List<Link>
            {
                new Link
                {
                    Title = "Telerik",
                    Url= "www.telerik.com"
                },
                new Link
                {
                    Title = "Telerik Academy",
                    Url = "www.Telerikacademy.com"
                },
                new Link
                {
                    Title = "Academy Foums",
                    Url = "forums.academy.telerik.com"
                }
            };
        }
    }
}