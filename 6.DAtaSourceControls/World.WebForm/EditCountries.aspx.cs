using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace World.WebForm
{
    public partial class EditCountries : System.Web.UI.Page
    {
        

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

        protected void CountriesDataSource_Deleting(object sender, EntityDataSourceChangingEventArgs e)
        {
            var editedCountry = (Data.Country)e.Entity;

            using (var context = new Data.WorldEntities())
            {
                var editedCountryInDB = context.Countries
                    .Include("Towns").FirstOrDefault(c => c.Id == editedCountry.Id);

                if (editedCountryInDB == null)
                {
                    return;
                }

                context.Towns.RemoveRange(editedCountryInDB.Towns);
                editedCountryInDB.Languages.Clear();
                

                context.SaveChanges();
            }
        }

        protected void ToggleInsertField(object sender, EventArgs e)
        {
            if (this.CountriesListView.InsertItemPosition == InsertItemPosition.None)
            {
                this.CountriesListView.InsertItemPosition = InsertItemPosition.LastItem;
            }
            else 
            {
                this.CountriesListView.InsertItemPosition = InsertItemPosition.None;
            }
        }

        protected void CountriesDataSource_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            var editedCountry = (Data.Country)e.Entity;
            var controlsMain = this.editCountriesForm.Controls;

            Control languageSelectControl;
            foreach (var control in controlsMain)
            {
                if (((Control)control).ID == "AddNewLanguage_InsertCountryy;")
                {
                    languageSelectControl = (Control)control;
                    break;
                }
            }

            //var values = (int[])this.AddNewLanguage_InsertCountryy.SelectedValue;
        }
    }
}