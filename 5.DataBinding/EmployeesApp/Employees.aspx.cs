using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeesApp
{
    public partial class Employees : System.Web.UI.Page
    {
        IEnumerable<Data.Employee> employees;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.employees = Data.EmployeesData.GetAll();

            this.employeesList.DataSource = this.employees;

            this.employeesGrid.DataSource = this.employees;

            this.DataBind();
        }

        protected void employeesGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            var item = e.Item.DataItem as Data.Employee;

            e.Item.Attributes["onmouseover"] = "getDetails(" + item.EmployeeID + ")";
        }

        protected void employeesGrid_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            var expression = e.SortExpression;

            var sortedEmployees = this.employees.OrderBy(em => em.FirstName);

            if (expression == "LastName")
	        {
                sortedEmployees = this.employees.OrderBy(em => em.LastName);
	        }

            if (expression == "City")
            {
                sortedEmployees = this.employees.OrderBy(em => em.City);
            }

            this.employeesGrid.DataSource = sortedEmployees;
            DataBind();
        }
    }
}