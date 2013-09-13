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

            var file = this.CountriesListView.EditItem.Controls[this.CountriesListView.EditItem.Controls.Count - 2] as FileUpload;

            //var fileOld = this.UploadFile;
            
            if (file == null || file.FileBytes.Length == 0)
            {
                ShowErrorMessage("Select file to upload");
                return;
            }

            if (file.FileName.IndexOf(".png") <= 0)
            {
                ShowErrorMessage("File must be a .PNG image");
                return;
            }

            var image = ImageHelper.ResizeImage(32, 32, file.FileBytes);

            var context = new Data.WorldEntities();
            var country = context.Countries.Find(countryId);

            country.Flag = image;

            context.SaveChanges();

            this.CountriesListView.UpdateItem(this.CountriesListView.EditItem.DisplayIndex, false);
            
        }

        private void ShowErrorMessage(string message)
        {
            var messageHtml = "<span class='text-error'>" + message + "</span>";

            this.ErrorMessage.Text = messageHtml;

        }

        protected string ConvertToBase64(byte[] file)
        {
            if (file == null)
            {
                return "#";
            }

            return "data:image/jpeg;base64," + Convert.ToBase64String(file);
        }       
    }
}