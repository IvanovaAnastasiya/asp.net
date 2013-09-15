using System;
using System.Drawing;
using System.Drawing.Imaging;

namespace GraphicalProject
{
    public partial class Counter : System.Web.UI.UserControl
    {
        private int Visitors
        {
            get
            {
                Application.Lock();
                var visitors = Convert.ToInt32(Application["Visitors"]);
                Application.UnLock();
                return visitors;
            }
            set
            {
                Application.Lock();
                var visitors = Convert.ToInt32(Application["Visitors"]);
                visitors = value;
                Application["Visitors"] = visitors;
                Application.UnLock();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            this.Visitors++;

            var btmap = new Bitmap(300, 50);
            using (btmap)
            {
                using (var graph = Graphics.FromImage(btmap))
                {
                    graph.DrawString(
                        s: "Visitors: " + this.Visitors.ToString(),
                        font: new Font(FontFamily.GenericSerif, 35, FontStyle.Italic),
                        brush: new SolidBrush(Color.Aquamarine),
                        point: new PointF(4f, 4f));

                    btmap.Save(Response.OutputStream, ImageFormat.Jpeg);
                    Response.ContentType = "image/jpeg";
                }
            }
        }
    }
}