using Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.TextBoxSearchQuery.Attributes["placeholder"] = "Search by book title / author...";
        }

        public IQueryable<Category> BooksRepeater_GetData()
        {
            var dbContex = new LibrarySystemEntities();
            return dbContex.Categories
                .Include("Books")
                .OrderBy(c => c.Id);
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            var query = this.TextBoxSearchQuery.Text;
            if (query.Length > 200)
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("Too long query!");
                return;
            }
            Response.Redirect("Search.aspx?query=" + query);
        }

    }
}