using EmployeesApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EmployeesApp.Controllers
{
    public class DetailsController : ApiController
    {
        [HttpGet]
        public EmployeeModel GetDetails(int id)
        {
            using (var context = new Data.NorthwindEntities())
            {
                var employee = context.Employees.Find(id);

                if (employee == null)
                {
                    throw new HttpRequestException("No such user found");
                }

                return new EmployeeModel 
                {
                    Photo = employee.Photo,
                    Phone = employee.HomePhone,
                    Email = employee.FirstName + "." + employee.LastName + "@northwnd.com",
                    Address = employee.Address,
                    Notes = employee.Notes
                };
            }
        }
    }
}