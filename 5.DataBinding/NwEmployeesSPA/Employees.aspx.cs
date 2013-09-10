using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NwEmployeesSPA
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var employeeList = Data.EmployeesData.GetNames();
            this.employeesGridView.DataSource = employeeList;
            this.employeesGridView.DataBind();
        }

        protected void EmployeesGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            var employeeId = (int)this.employeesGridView.SelectedValue;

            var employeeDetails = Data.EmployeesData.GetDetails(employeeId);

            this.employeeDetails.DataSource = new Data.Employee[] { employeeDetails };

            this.employeeDetails.DataBind();
        }
    }
}