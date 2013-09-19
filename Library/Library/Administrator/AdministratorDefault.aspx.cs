using System;
using System.Linq;
using OnlineDatingSystem.Data;
using OnlineDatingSystem.Models;
using System.Linq.Expressions;
using System.Collections.Generic;

namespace OnlineDatingSystem.Administrator
{
    public partial class AdministratorDefault : System.Web.UI.Page
    {
        private const string OrderBy = "orderBy";
        private const string Ascending = "ascending";
        private const string Descending = "descending";
        private const string OrderDirection = "orderDirection";

        public IQueryable<ApplicationUser> UsersView_GetData(string sortByExpression = null)
        {
            try
            {
                var context = new ApplicationDbContext();
                var users = context.Users.Include("City").Include("Country");
           
                IOrderedQueryable<ApplicationUser> orderedUser = null;
                if (sortByExpression != null)
                {
                    CacheSortBy(sortByExpression);
                    if (Session[OrderDirection] == Ascending)
                    {
                        orderedUser = Sort(users, sortByExpression);
                    }
                    else
                    {
                        orderedUser = SortDecending(users, sortByExpression);
                    }
                }
                else
                {
                    orderedUser = users.OrderBy(u => u.Id);
                }
                return orderedUser;
            }
            catch(Exception ex)
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage(ex);
                return new List<ApplicationUser>().AsQueryable();
            }
        }

        private IOrderedQueryable<ApplicationUser> SortDecending(IOrderedQueryable<ApplicationUser> users, string sortByExpression)
        {
            IOrderedQueryable<ApplicationUser> orderedUsers = null;

            switch (sortByExpression)
            {
                case "Username":
                    {
                        orderedUsers = users.OrderByDescending(u => u.UserName);
                        break;
                    }
                case "FirstName":
                    {
                        orderedUsers = users.OrderByDescending(u => u.FirstName);
                        break;
                    }
                case "LastName":
                    {
                        orderedUsers = users.OrderByDescending(u => u.LastName);
                        break;
                    }
                case "Email":
                    {
                        orderedUsers = users.OrderByDescending(u => u.Email);
                        break;
                    }

                case "City":
                    {
                        orderedUsers = users.OrderByDescending(u => u.City.Name);
                        break;
                    }
                case "Country":
                    {
                        orderedUsers = users.OrderByDescending(u => u.Country.Name);
                        break;
                    }
                default:
                    {
                        orderedUsers = users.OrderByDescending(u => u.Id);
                        break;
                    }
            };

            return orderedUsers;
        }

        private IOrderedQueryable<ApplicationUser> Sort(IOrderedQueryable<ApplicationUser> users, string sortByExpression)
        {
            IOrderedQueryable<ApplicationUser> orderedUsers = null;

            switch (sortByExpression)
            {
                case "Username":
                    {
                        orderedUsers = users.OrderBy(u => u.UserName);
                        break;
                    }
                case "FirstName":
                    {
                        orderedUsers = users.OrderBy(u => u.FirstName);
                        break;
                    }
                case "LastName":
                    {
                        orderedUsers = users.OrderBy(u => u.LastName);
                        break;
                    }
                case "Email":
                    {
                        orderedUsers = users.OrderBy(u => u.Email);
                        break;
                    }

                case "City":
                    {
                        orderedUsers = users.OrderBy(u => u.City.Name);
                        break;
                    }
                case "Country":
                    {
                        orderedUsers = users.OrderBy(u => u.Country.Name);
                        break;
                    }
                default:
                    {
                        orderedUsers = users.OrderBy(u => u.Id);
                        break;
                    }
            };

            return orderedUsers;
        }

        private void CacheSortBy(string sortByExpression)
        {
            if (sortByExpression != null)
            {
                if (Session[OrderBy] == sortByExpression)
                {
                    ToggleSortDirection();
                }
                else
                {
                    Session[OrderDirection] = Ascending;
                }
                Session[OrderBy] = sortByExpression;
            }
        }

        private void ToggleSortDirection()
        {
            var direction = Session[OrderDirection];
            if (direction == null || direction == Descending)
            {
                direction = Ascending;
            }
            else
            {
                direction = Descending;
            }
        }

        //public IQueryable<City> CityList_GetItems()
        //{
        //    var context = new ApplicationDbContext();
        //    var cities = context.Cities.OrderBy(c => c.Id);

        //    return cities;
        //}

        // The id parameter name should match the DataKeyNames value set on the control
        public void UsersView_DeleteItem(string id)
        {
            Response.Output.WriteLine("User deleted! Id(" + id + ")  Implement it!");
        }

        public enum SortByExpressions
        {
            Id,
            Username,
            FirstName,
            LastName,
            City,
            Country,
            Email
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<OnlineDatingSystem.Models.ApplicationUser> GridViewTestUsers_GetData()
        {
            try
            {
                var dbContext = new ApplicationDbContext();
                return dbContext.Users;
            }
            catch (Exception ex)
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage(ex);
                return new List<ApplicationUser>().AsQueryable();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridViewTestUsers_UpdateItem(string id)
        {
            var dbContext = new ApplicationDbContext();
            try
            {
                ApplicationUser item = dbContext.Users.Find(id);

                if (item == null)
                {
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                    return;
                }
                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    dbContext.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Error_Handler_Control.ErrorSuccessNotifier.AddErrorMessage(ex);
            }
        }
    }
}