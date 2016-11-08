using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Trabalho2
{
    public partial class PropsByOwner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource1.DataFile));
            XmlElement oOwner = xdoc.SelectSingleNode("/properties/property[@id=" + e.OldValues["id"] + "]/" +
                "owners/owner[@taxId=" + e.OldValues["taxId"] + "]") as XmlElement;
            oOwner.Attributes["taxId"].Value = e.NewValues["taxId"].ToString();

            XmlElement oPurchase = oOwner.SelectSingleNode("purchase") as XmlElement;
            oPurchase.Attributes["date"].Value = e.NewValues["date"].ToString();

            XmlElement oName = oOwner.SelectSingleNode("name") as XmlElement;
            oName.Attributes["firstname"].Value = e.NewValues["firstname"].ToString();
            oName.Attributes["lastname"].Value = e.NewValues["lastname"].ToString();
            xdoc.Save(Server.MapPath(XmlDataSource1.DataFile));

            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource2.DataFile));
            XmlElement oOwner = xdoc.SelectSingleNode("/properties/property/owners/owner[@taxId=" + e.Values["taxId"] + "]") as XmlElement;
            oOwner.ParentNode.RemoveChild(oOwner);
            xdoc.Save(Server.MapPath(XmlDataSource2.DataFile));

            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void InsertButton_PropertyOwner_Click(object sender, EventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource2.DataFile));

            XmlElement oProperties = xdoc.SelectSingleNode("/properties/property[@id=" +
                 (GridView2.FooterRow.FindControl("newOwnerRegister") as TextBox).Text + "]") as XmlElement;

            if (oProperties != null)
            {
                XmlElement owners = xdoc.SelectSingleNode("/properties/property[@id=" +
                    (GridView2.FooterRow.FindControl("newOwnerRegister") as TextBox).Text + "]/owners") as XmlElement;
                if (owners == null)
                {
                    owners = xdoc.CreateElement("owners");
                    oProperties.AppendChild(owners);
                }
                /*else if (owners.ChildNodes.Count != 0)
                {
                    XmlElement lastOwnerPurchase = xdoc.SelectSingleNode("/properties/property[@id=" +
                        (GridView2.FooterRow.FindControl("newOwnerRegister") as TextBox).Text + "]/owners" +
                        "/owner[last()]/purchase") as XmlElement;
                    XmlAttribute aSold = xdoc.CreateAttribute("sold");
                    aSold.Value = (GridView2.FooterRow.FindControl("newDate") as TextBox).Text;
                    lastOwnerPurchase.Attributes.Append(aSold);
                }*/

                XmlElement newOwner = xdoc.CreateElement("owner");
                XmlAttribute ataxId = xdoc.CreateAttribute("taxId");
                ataxId.Value = (GridView2.FooterRow.FindControl("newtaxId") as TextBox).Text;
                newOwner.Attributes.Append(ataxId);

                XmlElement oPurchase = xdoc.CreateElement("purchase");
                XmlAttribute aDate = xdoc.CreateAttribute("date");
                aDate.Value = (GridView2.FooterRow.FindControl("newDate") as TextBox).Text;
                oPurchase.Attributes.Append(aDate);

                XmlElement oName = xdoc.CreateElement("name");
                XmlAttribute aFirstName = xdoc.CreateAttribute("firstname");
                XmlAttribute aLastName = xdoc.CreateAttribute("lastname");
                aFirstName.Value = (GridView2.FooterRow.FindControl("newFirstName") as TextBox).Text;
                aLastName.Value = (GridView2.FooterRow.FindControl("newLastName") as TextBox).Text;
                oName.Attributes.Append(aFirstName);
                oName.Attributes.Append(aLastName);

                newOwner.AppendChild(oPurchase);
                newOwner.AppendChild(oName);
                owners.AppendChild(newOwner);

                xdoc.Save(Server.MapPath(XmlDataSource2.DataFile));

                Response.Redirect(Request.RawUrl);
            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            XmlDataSource3.XPath = "properties/property[@taxId='" + taxId.Text + "']";
        }

        protected void GridView3_DataBound(object sender, EventArgs e)
        {
            XmlDataSource3.XPath = "properties/property[@taxId='" + taxId.Text + "']";
        }
    }
}