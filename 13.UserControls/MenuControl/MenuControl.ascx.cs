using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MenuControl
{
    public partial class MenuControl : System.Web.UI.UserControl
    {
        public IEnumerable<Link> Items { get; set; }

        public string Font { get; set; }

        public System.Drawing.Color FontColor { get; set; }

        public MenuControl()
        {
            this.Items = new List<Link>();
            this.Font = "Segoe UI";
            this.FontColor = System.Drawing.Color.Black;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.DataListMenu.DataSource = this.Items;
            this.DataListMenu.Font.Name = this.Font;
            this.DataListMenu.ForeColor = this.FontColor;
            this.DataListMenu.DataBind();
        }
    }

    public class Link
    {
        private string url;

        public string Title { get; set; }

        public string Url
        {
            get
            {
                return this.url;
            }
            set
            {
                var trimmedUrl = value.Trim();
                if (!trimmedUrl.StartsWith("http"))
                {
                    trimmedUrl = "http://" + trimmedUrl;
                }

                this.url = trimmedUrl;
            }
        }
    }
}