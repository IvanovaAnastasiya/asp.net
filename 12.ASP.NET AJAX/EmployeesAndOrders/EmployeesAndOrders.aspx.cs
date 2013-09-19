using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmployeesAndOrders.Model;
using System.Threading;

namespace EmployeesAndOrders
{
    public partial class EmployeesAndOrders : System.Web.UI.Page
    {
        public IQueryable<Employee> Employees_GetData()
        {
            var dbContext = new NORTHWINDEntities();
            return dbContext.Employees;
        }
        

        protected void Employees_SelectedIndexChanged(object sender, EventArgs e)
        {
            Thread.Sleep(2000);
            var selected = this.Employees.SelectedValue;
            var id = Convert.ToInt32(selected);

            var dbContext = new NORTHWINDEntities();
            this.OrdersGridView.DataSource = dbContext.Orders.Where(o => o.EmployeeID == id).ToList();
            this.OrdersGridView.DataBind();
            this.OrdersUpdatePanel.Update();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}