using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2.NorthwindEmployees
{
    public partial class EmployeesList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var employees = EmployeesData.GetNames();

            this.employeesList.DataSource = employees;
            
            this.employeesList.DataBind();
        }
    }
}