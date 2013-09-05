using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RandomNumbers
{
    public partial class RandomNumbers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GenarateRandom_Click(object sender, EventArgs e)
        {
            string message = StartRandomCall(this.FromNumber.Text, this.ToNumber.Text);

            this.Result.Text = message;
            
        }

        private string StartRandomCall(string from, string to)
        {
            int fromNum, toNum;
            var fromNumParsed = int.TryParse(from, out fromNum);
            var toNumParsed = int.TryParse(to, out toNum);

            string message;

            if (fromNumParsed && toNumParsed)
            {
                int rand;

                if (fromNum < toNum)
                {
                    rand = GenerateRandom(fromNum, toNum);
                }
                else
                {
                    rand = GenerateRandom(toNum, fromNum);
                }

                message = rand.ToString();
            }
            else
            {
                message = "Only integer numbers please!";
            }

            return message;
        }

        private static int GenerateRandom(int fromNum, int toNum)
        {
            var rand = new Random().Next(fromNum, toNum);
            return rand;
        }

        protected void GenerateRandomHtml_ServerClick(object sender, EventArgs e)
        {
            var message = StartRandomCall(this.FirsNumberHtml.Value, this.ToNumberHtml.Value);

            this.randomHtml.InnerText = message;
        }
    }
}