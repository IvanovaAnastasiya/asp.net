using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Data
{
    public static class EmployeesData
    {
        public static IEnumerable<EmployeeModel> GetNames()
        {
            using (var context = new Data.NorthwindEntities())
            {
                var employees = context.Employees.Select(e => new EmployeeModel
                {
                    Id = e.EmployeeID,
                    Name = e.FirstName + " " + e.LastName
                }).ToList();

                return employees;
            }
        }

        public static Employee GetDetails(int id) 
        {
            using (var context = new Data.NorthwindEntities())
            {
                var employee = context.Employees.Find(id);

                if (employee == null)
                {
                    throw new ArgumentOutOfRangeException("No such employee was found!");
                }

                return employee;
            }
        }

        public static IEnumerable<Employee> GetAll()
        {
            using (var context = new NorthwindEntities())
            {
                return context.Employees.ToList();
            }
        }
    }
}