using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using World.Data;

namespace World.WebForm
{
    public partial class EditLanguages : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            var context = new Data.WorldEntities();
            var countryId = Convert.ToInt32(Request.Params["countryId"]);
            var selectedCountry = context.Countries.Include("Languages")
                .FirstOrDefault(c => c.Id == countryId);

            this.CountrySelected.Text = selectedCountry.Name;

            this.CurrentLanguages.DataSource = selectedCountry.Languages;
            this.CurrentLanguages.DataBind();
        }

        protected void AddSelectedLanguages_Click(object sender, EventArgs e)
        {
            var selectedIndices = this.SelectLanguageListBox.GetSelectedIndices();
            var languagesIds = new List<int>();
            
            foreach (var index in selectedIndices)
            {
                var id = int.Parse(this.SelectLanguageListBox.Items[index].Value);
                languagesIds.Add(id);
            }

            var context = new Data.WorldEntities();

            var country = context.Countries.Find(Convert.ToInt32(Request.Params["countryId"]));
            if (country == null)
            {
                this.ErrorMessage.Text = "No such country exists!";
                return;
            }

            foreach (var id in languagesIds)
            {
                var lanuguage = context.Languages.Find(id);
                if (lanuguage == null)
                {
                    this.ErrorMessage.Text = "Error in language selection!";
                    return;
                }

                country.Languages.Add(lanuguage);
            }
            try
            {
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                this.ErrorMessage.Text = ex.Message;
            }
        }

        protected void Delete_Command(object sender, CommandEventArgs e)
        {
            var languageId = Convert.ToInt32(e.CommandArgument);
            var countryId = Convert.ToInt32(Request.Params["countryId"]);
            var context = new Data.WorldEntities();
            var country = context.Countries.Include("Languages").FirstOrDefault(c => c.Id == countryId);
            
            if (country == null)
            {
                this.ErrorMessage.Text = "Wrong Country selected!";
                return;
            }

            var language = country.Languages.FirstOrDefault(l => l.Id == languageId);
            if (language == null)
            {
                this.ErrorMessage.Text = "Wrong Language selected!";
                return;
            }

            country.Languages.Remove(language);
            try
            {
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                this.ErrorMessage.Text = ex.Message;
            }
        }

        protected void DeleteSelectedLanguage_Click(object sender, EventArgs e)
        {
            var languageIndeces = this.SelectLanguageListBox.GetSelectedIndices();

            var languageIds = new List<int>();
            foreach (var index in languageIndeces)
            {
                var id = this.SelectLanguageListBox.Items[index].Value;

                languageIds.Add(Convert.ToInt32(id));
            }

            var context = new Data.WorldEntities();

            foreach (var id in languageIds)
            {
                var language = context.Languages.Find(id);
                context.Languages.Remove(language);
            }

            try
            {
                context.SaveChanges();
                this.SelectLanguageListBox.DataBind();
            }
            catch (Exception ex)
            {
                this.ErrorMessage.Text = ex.Message;
            }
        }

        protected void AddNewLanguageButton_Click(object sender, EventArgs e)
        {
            var newLanguageName = this.AddNewLanguageTextBox.Text;

            var context = new Data.WorldEntities();
            context.Languages.Add(new Language 
            {
                Name = newLanguageName
            });

            try
            {
                context.SaveChanges();
                this.SelectLanguageListBox.DataBind();
            }
            catch (Exception ex)
            {
                this.ErrorMessage.Text = ex.Message;
            }

        }
    }
}