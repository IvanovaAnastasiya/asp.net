using Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library.Registered
{
    public partial class Categories : System.Web.UI.Page
    {
        private int CategoryId
        {
            get
            {
                var id = this.Session["categoryToEdit"];
                if (id == null)
                {
                    return -1;
                }
                return (Convert.ToInt32(id));
            }
            set
            {
                this.Session["categoryToEdit"] = value.ToString();
            }
        }

        public IQueryable<Category> CategoriesGridView_GetData()
        {
            var dbContex = new LibrarySystemEntities();
            return dbContex.Categories;
        }

        #region Edit Command
        protected void EditButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument == null)
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("No selected category");
                return;
            }
            var id = Convert.ToInt32(e.CommandArgument);

            using (var dbContext = new LibrarySystemEntities())
            {
                var category = dbContext.Categories.Find(id);
                if (category == null)
                {
                    Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage("This category was not found!");
                    return;
                }
                this.CategoryEditTextBox.Text = category.Name;
                this.CategoryId = category.Id;
                this.EditCategoryPanel.Visible = true;
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            this.CategoryId = -1;
            this.CategoryEditTextBox.Text = "";
            this.EditCategoryPanel.Visible = false;
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            var id = this.CategoryId;
            if (id < 0)
            {
                Error_Handler_Control.ErrorSuccessNotifier
                    .AddErrorMessage("Category was NOT saved. Please try again!");
                return;
            }

            using (var dbContext = new LibrarySystemEntities())
            {
                var category = dbContext.Categories.Find(id);
                if (category == null)
                {
                    Error_Handler_Control.ErrorSuccessNotifier
                        .AddErrorMessage("Category was not found on server. Please try again!");
                    return;
                }

                if (this.ValidateCategoryName(this.CategoryEditTextBox.Text))
                {
                    category.Name = this.CategoryEditTextBox.Text;
                    try
                    {
                        dbContext.SaveChanges();

                        Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Saved!");
                        this.CloseEdit();
                    }
                    catch (EntityDataSourceValidationException ex)
                    {
                        Error_Handler_Control.ErrorSuccessNotifier
                            .AddErrorMessage(ex);
                    }
                }
            }
        } 
        #endregion

        #region Delete Command
        protected void DeleteButton_Command(object sender, CommandEventArgs e)
        {
            int id;
            if (e.CommandArgument == null ||
                !int.TryParse(e.CommandArgument.ToString(), out id))
            {
                Error_Handler_Control.ErrorSuccessNotifier
                    .AddErrorMessage("Command delete argument is invalid.");
                return;
            }

            this.CategoryId = id;
            this.ShowConfirmation();
        }
        protected void HandleConfirmationCommand(object sender, CommandEventArgs e)
        {
            if (e.CommandArgument == "Yes")
            {
                using (var dbContext = new LibrarySystemEntities())
                {
                    var category = dbContext.Categories.Find(this.CategoryId);
                    if (category == null)
                    {
                        Error_Handler_Control.ErrorSuccessNotifier
                            .AddErrorMessage("Category could not be deleted. Try again later!");
                        return;
                    }

                    try
                    {
                        dbContext.Books.RemoveRange(category.Books);
                        dbContext.Categories.Remove(category);
                        dbContext.SaveChanges();
                        Error_Handler_Control.ErrorSuccessNotifier.AddSuccessMessage("Deleted");
                        this.CategoriesGridView.DataBind();
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

            this.CategoryId = -1;
            this.DeleteConfirmationPanel.Visible = false;
        }       
        #endregion

        #region Insert command
        protected void InsertButton_Click(object sender, EventArgs e)
        {
            this.AddCategoryPanel.Visible = true;
        }

        protected void CancelAddCategoryButton_Click(object sender, EventArgs e)
        {
            this.CategoryAddTextBox.Text = "";
            this.AddCategoryPanel.Visible = false;
        }

        protected void AddCategoryButton_Click(object sender, EventArgs e)
        {
            var newCategoryName = this.CategoryAddTextBox.Text;
            if (this.ValidateCategoryName(newCategoryName))
            {
                using (var dbContext = new LibrarySystemEntities())
                {
                    try
                    {
                        dbContext.Categories.Add(new Category
                        {
                            Name = newCategoryName
                        });
                        dbContext.SaveChanges();
                        Error_Handler_Control.ErrorSuccessNotifier
                            .AddSuccessMessage("Added new!");
                        this.CategoriesGridView.DataBind();
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
        }
        #endregion

        private bool ValidateCategoryName(string categoryName)
        {
            var isValid = true;
            
            if (string.IsNullOrWhiteSpace(categoryName))
            {
                Error_Handler_Control.ErrorSuccessNotifier
                    .AddErrorMessage("Category can not be empty string.");
                isValid = false;
            }            
            else if (categoryName.Length < 3 || categoryName.Length > 100)
            {
                Error_Handler_Control.ErrorSuccessNotifier
                    .AddErrorMessage("Category must be between 3 and 100 charackters long!");
                isValid = false;
            }
            
            return isValid;
        }

        private void CloseEdit()
        {
            this.CancelButton_Click(this, null);
        }

        private void ShowConfirmation()
        {
            this.DeleteConfirmationPanel.Visible = true;
        }

    }
}