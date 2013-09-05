using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Escaping
{
    public partial class EscapeHtml : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextTransfer_Click(object sender, EventArgs e)
        {
            var text = this.TextInput.Text;
            this.TextOutput.Text = text;
            this.LabelOutput.Text = Server.HtmlEncode(text)s;
        }
    }
}