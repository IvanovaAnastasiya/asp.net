using System;
using System.Linq;
using System.Reflection;

namespace HelloASP
{
    public partial class hello : System.Web.UI.Page
    {
        private DateTime startTime;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.startTime = DateTime.Now;
            AssemblyLocation.InnerText = "Location: " + Assembly.GetAssembly(typeof(Assembly)).Location;

            this.events.Text += "0 milliseconds: Page_Load Fired \n";
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
            printFromCode.InnerText = "Printed from code!";
        }


        protected void Page_PreInit(object sender, EventArgs e)
        {
            this.events.Text += (DateTime.Now - this.startTime).Milliseconds + " milliseconds: Page_PreInit Fired \n";
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            this.events.Text += (DateTime.Now - this.startTime).Milliseconds + " milliseconds: Page_Init Fired \n";
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.events.Text += (DateTime.Now - this.startTime).Milliseconds + " milliseconds: Page_PreRender Fired \n";
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            // Response is unavailable at page unload
            // Response.Write("Page_Unload invoked" + "<br/>");
        }

        protected void ButtonOK_Init(object sender, EventArgs e)
        {
            this.events.Text += (DateTime.Now - this.startTime).Milliseconds + " milliseconds: ButtonOK_Init Fired \n";

        }

        protected void ButtonOK_Load(object sender, EventArgs e)
        {
            this.events.Text += (DateTime.Now - this.startTime).Milliseconds + " milliseconds: ButtonOK_Load Fired \n";

        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            this.events.Text += (DateTime.Now - this.startTime).Milliseconds + " milliseconds: ButtonOK_Click Fired \n";

        }

        protected void ButtonOK_PreRender(object sender, EventArgs e)
        {
            this.events.Text += (DateTime.Now - this.startTime).Milliseconds + " milliseconds: ButtonOK_PreRender Fired \n";

        }

        protected void ButtonOK_Unload(object sender, EventArgs e)
        {
            this.events.Text += (DateTime.Now - this.startTime).Milliseconds + " milliseconds: ButtonOK_Unload Fired \n";
        }
    }
}