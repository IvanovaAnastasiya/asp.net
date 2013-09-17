using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ValidationControl
{
    public partial class UserRegisterForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ValidateLoginButton_Click(object sender, EventArgs e)
        {
            this.Validate("Login");
        }
    }
}