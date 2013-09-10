using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Repeater
{
    public partial class EmploeesRepeater : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var employees = Data.EmployeesData.GetAll();
            this.employeesRepeater.DataSource = employees;
            this.employeesRepeater.DataBind();
        }
    }
}