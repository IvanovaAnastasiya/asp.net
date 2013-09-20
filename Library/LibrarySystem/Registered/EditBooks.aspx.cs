using Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Error_Handler_Control;
using System.Text.RegularExpressions;

namespace Library.Registered
{
    public partial class EditBooks : System.Web.UI.Page
    {
        private int BookId
        {
            get
            {
                var bookId = this.Session["bookId"] ;
                return bookId != null ? Convert.ToInt32(bookId) : -1;
            }
            set
            {
                this.Session["bookId"] = value;
            }
        }

        public IQueryable<Library.Models.Book> BooksGridView_GetData()
        {
            var dbContext = new LibrarySystemEntities();
            return dbContext.Books.Include("Category");
        }

        

        #region Add new book methods
        protected void OpenInsertForm_Click(object sender, EventArgs e)
        {
            var dbContex = new LibrarySystemEntities();
            this.NewBookCategoryDropDown.DataSource = dbContex.Categories.ToList();
            this.NewBookCategoryDropDown.DataBind();

            this.AddBookPanel.Visible = true;

        }

        protected void CreateNewBookButton_Click(object sender, EventArgs e)
        {
            int newBookCategoryId;
            var validCategoryId = int.TryParse(this.NewBookCategoryDropDown.SelectedValue, out newBookCategoryId);
            if (!ValidateInsertFields() || !validCategoryId)
            {
                return;
            }

            using (var dbContext = new LibrarySystemEntities())
            {
                try
                {
                    dbContext.Books.Add(new Book
                    {
                        Title = this.NewBookTitle.Text,
                        Author = this.NewBookAuthor.Text,
                        ISBN = this.NewBookISBN.Text,
                        Url = this.NewBookUrl.Text,
                        Description = this.NewBookDescription.InnerText,
                        Category = dbContext.Categories.Find(newBookCategoryId)
                    });
                    dbContext.SaveChanges();
                    this.CleanAndHideInsertForm();

                    ErrorSuccessNotifier.AddSuccessMessage("Created!");

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
        }


        protected void CancelNewBookCreating_Click(object sender, EventArgs e)
        {
            this.AddBookPanel.Visible = false;
        }
        private void CleanAndHideInsertForm()
        {
            this.NewBookTitle.Text = "";
            this.NewBookAuthor.Text = "";
            this.NewBookISBN.Text = "";
            this.NewBookUrl.Text = "";
            this.NewBookDescription.InnerText = "";

            this.AddBookPanel.Visible = false;

        }
        #endregion

        #region Validation methods
        private bool ValidateInsertFields()
        {
            var areValid = true;

            if (!this.ValidateTitle(this.NewBookTitle.Text))
            {
                areValid = false;
            }

            if (!this.ValidateAuthorName(this.NewBookAuthor.Text))
            {
                areValid = false;
            }

            if (!this.ValidateISBN(this.NewBookISBN.Text))
            {
                areValid = false;
            }

            if (!this.ValidateUrl(this.NewBookUrl.Text))
            {
                areValid = false;
            }

            if (!this.ValidateDescription(this.NewBookDescription.InnerText))
            {
                areValid = false;
            }

            return areValid;
        }

        private bool ValidateTitle(string bookTitle)
        {
            var isValid = true;
            if (string.IsNullOrWhiteSpace(bookTitle))
            {
                ErrorSuccessNotifier.AddErrorMessage("Book title must be non-empty!");
                isValid = false;
            }
            else if (bookTitle.Length < 2 || bookTitle.Length > 250)
            {
                ErrorSuccessNotifier.AddErrorMessage("Book title's length should be 2 to 250 symbols");
                isValid = false;
            }

            return isValid;
        }

        private bool ValidateAuthorName(string authorName)
        {
            var isValid = true;
            if (string.IsNullOrWhiteSpace(authorName))
            {
                ErrorSuccessNotifier.AddErrorMessage("Author's name must be non-empty!");
                isValid = false;
            }
            else if (authorName.Length < 2 || authorName.Length > 250)
            {
                ErrorSuccessNotifier.AddErrorMessage("Author's name length should be 2 to 250 symbols. Acceptable: Ki, Sandler, Ho Chi Mo");
                isValid = false;
            }

            return isValid;
        }

        private bool ValidateISBN(string ISBN)
        {
            var isValid = true;
            if (string.IsNullOrEmpty(ISBN))
            {
                return true;
            }
            else if (ISBN.Length != 17)
            {
                ErrorSuccessNotifier.AddErrorMessage("ISBN's length is exactly 17 symbols: 978-954-400-773-7");
                isValid = false;
            }
            else if (!Regex.IsMatch(ISBN, @"^[\d-]{17}$"))
            {
                ErrorSuccessNotifier.AddErrorMessage("ISBN consists only of digits and '-': 978-954-400-773-7");
                isValid = false;
            }

            return isValid;
        }

        private bool ValidateUrl(string url)
        {
            var isValid = true;
            if (string.IsNullOrEmpty(url))
            {
                return true;
            }
            else if (url.Length > 256 || url.Length < 12)
            {
                ErrorSuccessNotifier.AddErrorMessage("Web Site Address must be between 12 and 256 symbols");
                isValid = false;
            }
            else if (!Regex.IsMatch(url, @"^http[s]?://[A-Za-z/\.-]+$"))
            {
                ErrorSuccessNotifier.AddErrorMessage("Web Site Address must start with http:// or https:// " +
                    " and have letters, dots and hyphons in it : http://example-book.com/first-page or https://book.example.com/laset/minor-change");
                isValid = false;
            }

            return isValid;
        }

        private bool ValidateDescription(string description)
        {
            var isValid = true;
            if (string.IsNullOrWhiteSpace(description))
            {
                return true;
            }
            else if (description.Length < 10)
            {
                ErrorSuccessNotifier.AddErrorMessage("Description length should be at least 10 symbols.");
                isValid = false;
            }

            return isValid;
        }
        #endregion

        #region Edit Commands
        protected void EditBookButton_Command(object sender, CommandEventArgs e)
        {
            var bookId = e.CommandArgument;
            if (bookId == null)
            {
                Error_Handler_Control.ErrorSuccessNotifier
                    .AddErrorMessage("Selected book couldn't be opened for editing.");
                return;
            }

            this.BookId = Convert.ToInt32(bookId);
            using (var dbContext = new LibrarySystemEntities())
            {
                try
                {
                    var book = dbContext.Books.Find(this.BookId);
                    var selectedBookCategory = book.CategoryId.ToString();

                    var categories = dbContext.Categories.ToList();

                    this.EditBookCategoryDropDown.DataSource = categories;
                    this.EditBookCategoryDropDown.DataBind();
                    this.EditBookCategoryDropDown.SelectedValue = selectedBookCategory;

                    this.EditBookTitle.Text = book.Title;
                    this.EditBookAuthor.Text = book.Author;
                    this.EditBookISBN.Text = book.ISBN;
                    this.EditBookUrl.Text = book.Url;
                    this.EditBookDescription.InnerText = book.Description;

                }
                catch (EntityDataSourceValidationException ex)
                {
                    Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage(ex);
                    return;
                }
                catch
                {
                    Error_Handler_Control.ErrorSuccessNotifier
                        .AddErrorMessage("The database connection was lost. Try again later.");
                    return;
                }

            }

            this.EditBookPanel.Visible = true;
        }

        protected void UpdateBookBotton_Click(object sender, EventArgs e)
        {
            if (!this.ValidataEditBookEntries())
            {
                return;
            }
            if (this.BookId < 0)
            {
                Error_Handler_Control.ErrorSuccessNotifier
                    .AddErrorMessage("Book's id was unclear. Please go back and try again.");
                return;
            }

            using (var dbContext = new LibrarySystemEntities())
            {
                try
                {
                    var category = this.EditBookCategoryDropDown.SelectedValue;
                    int categoryId;
                    if (!int.TryParse(category, out categoryId))
                    {
                        throw new ArgumentException("Book's category was unclear. Please go back and try again.");
                    }

                    var book = dbContext.Books.Find(BookId);
                    book.Title = this.EditBookTitle.Text;
                    book.Author = this.EditBookAuthor.Text;
                    book.ISBN = this.EditBookISBN.Text;
                    book.Url = this.EditBookUrl.Text;
                    book.Description = this.EditBookDescription.InnerText;

                    if (book.CategoryId != categoryId)
                    {
                        book.Category = dbContext.Categories.Find(categoryId);
                    }

                    dbContext.SaveChanges();
                    this.ClearAndHideEditForm();
                    Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Edited!");

                }
                catch (EntityDataSourceValidationException ex)
                {
                    Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage(ex);
                }
                catch (Exception ex)
                {
                    Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage(ex.Message);
                }
            }
        }

        private bool ValidataEditBookEntries()
        {
            var areValid = true;
            if (!ValidateTitle(this.EditBookTitle.Text))
            {
                areValid = false;
            }

            if (!ValidateAuthorName(this.EditBookAuthor.Text))
            {
                areValid = false;
            }

            if (!ValidateISBN(this.EditBookISBN.Text))
            {
                areValid = false;
            }

            if (!ValidateUrl(this.EditBookUrl.Text))
            {
                areValid = false;
            }

            if (!ValidateDescription(this.EditBookDescription.InnerText))
            {
                areValid = false;
            }

            return areValid;
        }

        protected void CancelUpdateBook_Click(object sender, EventArgs e)
        {
            this.ClearAndHideEditForm();
        }

        private void ClearAndHideEditForm()
        {
            this.EditBookTitle.Text = "";
            this.EditBookAuthor.Text = "";
            this.EditBookISBN.Text = "";
            this.EditBookUrl.Text = "";
            this.EditBookDescription.InnerText = "";

            this.BookId = -1;
            this.EditBookPanel.Visible = false;

        }
        
        #endregion

        protected void DeleteBookButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument == null)
            {
                return;
            }
            this.BookId = Convert.ToInt32(e.CommandArgument);
            this.DeleteConfirmationPanel.Visible = true;
        }


        protected void DeleteAction_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument == "Yes")
            {
                if (this.BookId < 0)
                {
                    Error_Handler_Control.ErrorSuccessNotifier
                        .AddErrorMessage("Books' id was lost. Please try again;");
                    Response.Redirect("~/Registered/EditBooks.aspx");
                }
                try
                {
                    using (var dbContex = new LibrarySystemEntities())
                    {
                        var book = dbContex.Books.Find(this.BookId);
                        dbContex.Books.Remove(book);
                        dbContex.SaveChanges();
                        ErrorSuccessNotifier.AddSuccessMessage("Deleted!");
                        this.BooksGridView.DataBind();
                        this.DeleteConfirmationPanel.Visible = false;
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
        }
    }
}