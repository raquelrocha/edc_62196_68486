using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp1
{
    public partial class books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
        }

        protected void Unnamed1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            SqlDataSource1.DataBind();
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
        }
    }
}