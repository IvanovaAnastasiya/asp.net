using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace World.WebForm
{
    public partial class EditContinents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ErrorMessageHolder.InnerText = "";
        }

        protected void DeleteContintent_Click(object sender, EventArgs e)
        {
            using (var context = new Data.WorldEntities())
            {
                if (this.SelectedContinent.SelectedItem == null)
                {
                    this.ErrorMessageHolder.InnerText = "No continent selected";
                    return; 
                }

                var selectedId = int.Parse(this.SelectedContinent.SelectedItem.Value);

                var continent = context.Continents.FirstOrDefault(c => c.Id == selectedId);
                if (continent == null)
                {
                    this.ErrorMessageHolder.InnerText = "No such continent found. Try again.";
                    return;
                }


                var countries = context.Countries.Include("Towns").Where(c => c.ContinentId == selectedId);

                foreach (var country in countries)
                {
                    context.Towns.RemoveRange(country.Towns);
                    context.Countries.Remove(country);
                }               

                context.Continents.Remove(continent);
                context.SaveChanges();

                Server.Transfer("EditContinents.aspx");
            }
        }

        protected void EditContinent_Click(object sender, EventArgs e)
        {
            if (this.SelectedContinent.SelectedItem == null)
            {
                this.ErrorMessageHolder.InnerText = "No continent selected";
                    return;
            }

            var id = int.Parse(this.SelectedContinent.SelectedValue);
            var newName = this.EditContinentName.Text;
            if (newName.Length < 4 || newName.Length > 50)
            {
                this.ErrorMessageHolder.InnerText = "Continent's name must be at least 4 symbols and not more then 50 symbols";
                return;
            }
            
            using (var context = new Data.WorldEntities())
            {
                var continent = context.Continents.Find(id);
                if (continent == null)
                {
                    this.ErrorMessageHolder.InnerText = "No such continent found. Try again.";
                    return;
                }
                continent.Name = newName;

                context.SaveChanges();
                Server.Transfer("EditContinents.aspx");
            }
        }

        protected void AddNewContinent_Click(object sender, EventArgs e)
        {
            var newName = this.NewContinentName.Text;
            if (newName.Length < 4 || newName.Length > 50)
            {
                this.ErrorMessageHolder.InnerText = "Continent's name must be at least 4 symbols and not more then 50 symbols";
                return;
            }

            using (var context = new Data.WorldEntities())
            {
                context.Continents.Add(new Data.Continent { Name = newName });
                context.SaveChanges();
                Server.Transfer("EditContinents.aspx");
            }
        }

        protected void SelectedContinent_SelectedIndexChanged(object sender, EventArgs e)
        {
            var name = ((ListBox)sender).SelectedItem.Text;            
            this.EditContinentName.Text = name;
        }
    }
}