using Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Error_Handler_Control;

namespace Library
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!(HasBookId() && IsValidId()))
            {
                Response.Redirect("~/Default.aspx");
                //return;
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            try
            {
                var id = int.Parse(Request.Params["bookId"]);

                using (var context = new LibrarySystemEntities())
                {
                    var book = context.Books.Find(id);
                    if (book == null)
                    {
                        ErrorSuccessNotifier.AddErrorMessage("Book not found!");
                        return;
                    }
                    this.LabelTitle.InnerText = book.Title;
                    this.LabelAuthor.Text = "by "+ book.Author;
                    this.BookISBN.InnerText = book.ISBN != null?"ISBN: " + book.ISBN : "No ISBN for this book";
                    this.BookUrl.Text = book.Url != null ?
                        "Web site: <a href=" + Server.HtmlEncode(book.Url) + ">" + Server.HtmlEncode(book.Url) + "</a>" : 
                        "No website for this book";
                    this.BookDescription.InnerText = book.Description;
                }
            }
            catch (EntityDataSourceValidationException ex)
            {
                ErrorSuccessNotifier.AddErrorMessage(ex);
            }
            catch (Exception ex)
            {
                ErrorSuccessNotifier.AddErrorMessage(ex.Message);
            }
        }

        private bool IsValidId()
        {
            var bookId = Request.Params["bookId"];
            int id;
            if (!int.TryParse(bookId, out id))
            {
                return false;
            }
            return true;
        }

        private bool HasBookId()
        {
            var bookId = Request.Params["bookId"];
            if (bookId == null)
            {
                return false;
            }

            return true;
        }
    }
}