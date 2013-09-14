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
                return "No Languages";
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

        protected void CountriesDataSource_Inserted(object sender, EntityDataSourceChangedEventArgs e)
        {
            this.ToggleInsertField(this, null);
        }

        protected void ChangeFlagButton_Command(object sender, CommandEventArgs e)
        {
            var countryId = Convert.ToInt32(e.CommandArgument);
            var file = this.UploadFile.FileBytes;

            var context = new Data.WorldEntities();
            var country = context.Countries.Find(countryId);
            
            country.Flag = file;

            context.SaveChanges();
        }

        protected string ConvertToBase64(byte[] file)
        {
            return Convert.ToBase64String(file);
        }
    }
}