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
    }
}