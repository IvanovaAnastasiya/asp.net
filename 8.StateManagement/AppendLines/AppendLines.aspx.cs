using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppendLines
{
    public partial class AppendLines : System.Web.UI.Page
    {
        const string TextLinesIdentifier = "textLines";

        private List<string> List
        {
            get
            {
                var list = Session[TextLinesIdentifier] as List<string>;
                if (list == null)
                {
                    list = new List<string>();
                }
                return list;
            }
            set
            {
                Session[TextLinesIdentifier] = value;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            var list = List;
            var msg = string.Join("<br>", list);

            this.TextLines.Text = msg;
        }

        protected void NextText_Click(object sender, EventArgs e)
        {
            var list = List;
            list.Add(this.LineTextBox.Text);
            List = list;
        }
    }
}