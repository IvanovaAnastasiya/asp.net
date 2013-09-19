using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ValidationControl
{
    public partial class UserRegisterForm : System.Web.UI.Page
    {
        protected void ValidateLoginButton_Click(object sender, EventArgs e)
        {
            this.Validate("Login");
            if (IsValid)
            {
                this.IsUserValid.Text = "User is valid!";
            }
        }

        protected void ValidatePerosnalInfoButton_Click(object sender, EventArgs e)
        {
            this.Validate("PerosnalInfo");
            if (IsValid)
            {
                this.IsPersonalInfoValid.Text = "Personal info is valid!";
            }
        }

        protected void ValidateContactInfoButton_Click(object sender, EventArgs e)
        {
            this.Validate("ContactInfo");
            if (IsValid)
            {
                this.IsValidContactInfo.Text = "Contact info is valid!";
            }
        }

        protected void WholeFormCheckButton_Click(object sender, EventArgs e)
        {
            if (!this.AgreedCheckBox.Checked)
            {
                this.WholeFormValidLabel.Text = "Chech the box!";
                return;
            }

            this.ValidateContactInfoButton_Click(this, null);
            this.ValidateLoginButton_Click(this, null);
            this.ValidatePerosnalInfoButton_Click(this, null);

            this.Validate();
            if (IsValid)
            {
                this.WholeFormValidLabel.Text = "Valid form!";
            }
        }

    }
}