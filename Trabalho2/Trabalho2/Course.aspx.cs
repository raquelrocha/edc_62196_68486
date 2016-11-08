using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Trabalho2
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            curso.DataFile = "http://acesso.ua.pt/xml/curso.asp?i=" + Request.QueryString["ID"];
            curso.DataBind();
        }

        protected void curso_Load(object sender, EventArgs e)
        {
            if (curso.GetXmlDocument().DocumentElement.Attributes["guid"].Value == "")
            {
                Response.Redirect("~/Courses");
            }
        }
    }
}