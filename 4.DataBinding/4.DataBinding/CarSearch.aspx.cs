using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _4.DataBinding
{
    public partial class CarSearch : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            var manufacturers = new List<Manufacturer>() 
            {
                new Manufacturer("Opel"),
                new Manufacturer("Mercedes"),
                new Manufacturer("BMW"),
                new Manufacturer("Trabant"),
                new Manufacturer("Vartburg"),
                new Manufacturer("Honda")
            };

            this.ManufacturerDropDown.DataSource = manufacturers.Select(m => m.Name);
            this.ManufacturerDropDown.DataBind();
        }

        protected void ManufacturerDropDown_SelectedIndexChanged(object sender, 
            System.Web.UI.WebControls.ListViewItemEventArgs e)
        {
        }
    }
}