using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2.NorthwindEmployees
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Request.QueryString.Count > 0)
            {
                var id = int.Parse(this.Request.QueryString[0]);
                var employee = EmployeesData.GetDetails(id);

                var dataSource = new List<Employee>() 
                {
                    employee 
                };

                this.employeeDetailsView.DataSource = dataSource;
                this.employeeDetailsView.DataBind();
            }
            else 
            {
                this.Server.TransferRequest("EmployeesList.aspx");
            }
            
        }
    }
}