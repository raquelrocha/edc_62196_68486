using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Trabalho2
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            coursesXml.XPath = "/cursos/curso[@Grau='" + DropDownList1.SelectedValue + "' and @Local='" + DropDownList2.SelectedValue + "']";
        }

        
        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            coursesXml.XPath = "/cursos/curso[@Grau='" + DropDownList1.SelectedValue + "' and @Local='" + DropDownList2.SelectedValue + "']";
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            coursesXml.XPath = "/cursos/curso[@Grau='" + DropDownList1.SelectedValue + "' and @Local='" + DropDownList2.SelectedValue + "']";
        }
    }
}