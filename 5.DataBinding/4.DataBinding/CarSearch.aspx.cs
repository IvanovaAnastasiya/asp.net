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
        static List<Manufacturer> manufacturers = new List<Manufacturer>() 
        {
            new Manufacturer("Opel"),
            new Manufacturer("Mercedes"),
            new Manufacturer("BMW"),
            new Manufacturer("Trabant"),
            new Manufacturer("Vartburg"),
            new Manufacturer("Honda")
        };

        List<Model> cars = new List<Model>() 
        {
            new Model{Name="Cadet", Year=1993, Manufacturer = manufacturers[0], 
                Extras = new List<Extra>(){new Extra{Name="Electric Side Mirrors"}, new Extra{Name="Windshield Tint"}}},
            new Model{Name="124", Year=1994, Manufacturer = manufacturers[1], 
                Extras = new List<Extra>(){new Extra{Name="Electric Side Mirrors"}}},
            new Model{Name="7", Year=2003, Manufacturer = manufacturers[2], 
                Extras = new List<Extra>(){new Extra{Name="Electric Side Mirrors"}, new Extra{Name="Windshield Tint"}, new Extra{Name="Air Conditioner"}}},
            new Model{Name="Civic", Year=1993, Manufacturer = manufacturers[5], 
                Extras = new List<Extra>(){new Extra{Name="DOHC"}, new Extra{Name="Carburator"}}},
            new Model{Name="125 Kombi", Year=1993, Manufacturer = manufacturers[3], Extras = new List<Extra>() },      
            new Model{Name="Astra", Year=2003, Manufacturer = manufacturers[0], 
                Extras = new List<Extra>(){new Extra{Name="Electric Seats"}, new Extra{Name="Windshield Tint"}}},
            new Model{Name="Vectra", Year=2004, Manufacturer = manufacturers[0], 
                Extras = new List<Extra>(){ new Extra{Name="Electric Side Mirrors"} }},
            new Model{Name="5", Year=2003, Manufacturer = manufacturers[2], 
                Extras = new List<Extra>(){new Extra{Name="Electric Side Mirrors"}, new Extra{Name="Windshield Tint"}, new Extra{Name="Air Conditioner"}}},
            new Model{Name="Accord", Year=1993, Manufacturer = manufacturers[5], 
                Extras = new List<Extra>(){new Extra{Name="Air Conditioner"}, new Extra{Name="Carburator"}}},
            new Model{Name="3M", Year=1993, Manufacturer = manufacturers[2], Extras = new List<Extra>()},            
        };
        
        protected void Page_Init(object sender, EventArgs e)
        {   
            this.ManufacturerDropDown.DataSource = manufacturers;
            this.ManufacturerDropDown.DataTextField = "Name";
            this.ManufacturerDropDown.DataBind();

            var extrasLists = this.cars.SelectMany(c => c.Extras).Select(ex => ex.Name).Distinct();
            this.Extras.DataSource = extrasLists;
            this.Extras.DataBind();
        }

        protected void ManufacturerDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selected = this.ManufacturerDropDown.SelectedItem.Value;
            var modelsSelected = this.cars.Where(m => m.Manufacturer.Name == selected);

            this.ModelsDropDown.DataSource = modelsSelected;
            this.ModelsDropDown.DataTextField = "Name";
            this.ModelsDropDown.DataBind();
        }

        protected void SearchCar_Click(object sender, EventArgs e)
        {
            var manufact = this.ManufacturerDropDown.SelectedItem.Value;
            var model = this.ModelsDropDown.SelectedValue;
            var extras = GetSelected(this.Extras.Items);

            var found = this.cars
                .Where(c => c.Manufacturer.Name == manufact &&
                    c.Name == model);

            if (extras.Count() > 0)
            {
                found = found.Where(f => f.Extras.Any(extra => extras.Any(extr => extr == extra.Name)));
            }

            this.Results.Text = "\nSelected values:\nManufacturer: " + manufact + " Model: " + model + " Extras: " + string.Join(", ", extras);
        }

        private IEnumerable<string> GetSelected(ListItemCollection listItemCollection)
        {
            var extasSelected = new List<string>();

            for (int i = 0; i < listItemCollection.Count; i++)
            {
                if (listItemCollection[i].Selected == true)
                {
                    extasSelected.Add(listItemCollection[i].Value);
                }
            }

            return extasSelected;
        }       
    }
}