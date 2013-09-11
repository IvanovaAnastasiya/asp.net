using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ListView
{
    public partial class EmployeesList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var employees = Data.EmployeesData.GetAll();

            this.listView.DataSource = employees;
            this.listView.DataBind();
        }
    }
}