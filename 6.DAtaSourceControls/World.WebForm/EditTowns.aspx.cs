using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace World.WebForm
{
    public partial class EditTowns : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {                   
        }

        protected string GetCountryId() 
        {
            return this.CountriesDropDownList.SelectedValue;
        }

        protected void TownsDataSource_Deleting(object sender, EntityDataSourceChangingEventArgs e)
        {               
        }

        protected void InsertButtonShow_Click(object sender, EventArgs e)
        {
            if (this.TownsListView.InsertItemPosition == InsertItemPosition.None)
            {
                this.TownsListView.InsertItemPosition = InsertItemPosition.LastItem;                
            }
            else
            {
                this.TownsListView.InsertItemPosition = InsertItemPosition.None;
            }
        }        
    }
}