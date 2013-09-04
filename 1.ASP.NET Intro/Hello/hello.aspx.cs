using System;
using System.Linq;

namespace HelloASP
{
    public partial class hello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonHi_Click(object sender, EventArgs e)
        {
            var inputText = NameInput.Text;
            
            if (inputText == "your name")
            {
                NameOutput.Text = "<span class='span12 active'> You hacked it</span>";
                NameOutput.Attributes.Add("href", "http://www.wikihow.com/Hack-a-Website-with-Basic-HTML-Coding");
                return;
            }

            NameOutput.Text = "Hello, " + inputText;
        }

        protected void PrintFromCode(object sender, EventArgs e)
        {

        }        
    }
}