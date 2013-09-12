using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace World.WebForm
{
    public partial class World : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var context = new Data.WorldEntities();
        }

        protected void CountriesGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected string GetLanguages(IEnumerable<Data.Language> languages) 
        {
            if (languages.Count() == 0)
            {
                return "No languages for this country";
            }
            var builder = new StringBuilder();
            foreach (var language in languages)
            {
                builder.Append(language.Name + ", ");
            }
            builder.Length -= 2;

            return builder.ToString();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void CountriesGrid_DeleteItem(int id)
        {
            using (var context = new Data.WorldEntities())
            {
                var country = context.Countries.Include("Towns").FirstOrDefault(c => c.Id == id);
                if (country == null)
                {
                    return;
                }

                var towns = country.Towns;
                if (towns.Count > 0)
                {
                    foreach (var town in towns)
                    {
                        context.Towns.Remove(town);
                    }
                }

                context.Countries.Remove(country);
                context.SaveChanges();
            }
        }

        protected void CountriesGrid_RowDataBound(object sender,
        GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = 
                    ClientScript.GetPostBackClientHyperlink(this.CountriesGrid, "Select$" + e.Row.RowIndex);
            }
        }
        
    }
}