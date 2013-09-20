using Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Book> BooksInCategory_GetData()
        {
            var query = Request.Params["query"];
            if (query == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            if (query.Length > 200)
            {
                Error_Handler_Control.ErrorSuccessNotifier
                    .AddErrorMessage("Query was too long. Allowed up to 200 symbols");
                return new List<Book>().AsQueryable();
            }
            var dbContext = new LibrarySystemEntities();

            IQueryable<Book> books = dbContext.Books;
            if (!string.IsNullOrEmpty(query))
            {
                var queryToLower = query.ToLower();
                books = books.Where(b =>
                   b.Author.IndexOf(queryToLower) > 0 || b.Title.IndexOf(queryToLower) > 0);
            }
            return books.OrderBy(b => b.Title).ThenBy(b => b.Author);
        }
    }
}