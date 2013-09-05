using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Intro
{
    public partial class AspIntro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CalculateSum_Click(object sender, EventArgs e)
        {

            float first, second;
            var firstParsed = float.TryParse(this.FirstNumber.Text, out first);
            var secondParsed = float.TryParse(this.SecondNumber.Text, out second);
            if (firstParsed && secondParsed)
            {
                var sum = first + second;
                this.sum.InnerText = sum.ToString();
            }
            else
            {
                this.sum.InnerText = "Only numbers please";
            }
        }
    }
}