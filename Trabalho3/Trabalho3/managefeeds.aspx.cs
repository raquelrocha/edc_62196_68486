using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Trabalho3
{
    public partial class managefeeds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void NewFeed_Click(object sender, EventArgs e)
        {
            DetailsView2.ChangeMode(DetailsViewMode.Insert);
            DetailsView2.DataBind();
        }

       
        protected void DeleteFeed_Command(object sender, CommandEventArgs e)
        {
            XmlDocument xdoc = XmlDataSource4.GetXmlDocument();
            XmlElement oFeed = xdoc.SelectSingleNode("/feeds/feed[@name='" + e.CommandArgument + "']") as XmlElement;
            xdoc.DocumentElement.RemoveChild(oFeed);
            xdoc.Save(Server.MapPath(XmlDataSource4.DataFile));

            Response.Redirect(Request.RawUrl);
        }

        protected void DetailsView2_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            XmlDocument xdoc = XmlDataSource4.GetXmlDocument();

            XmlElement FeedsList = xdoc.SelectSingleNode("/feeds") as XmlElement;
            XmlElement checkFeed = xdoc.SelectSingleNode("/feeds/feed[@name='" + e.Values["name"].ToString() + "']") as XmlElement;

            if (checkFeed == null)
            {
                XmlElement oFeed = xdoc.CreateElement("feed");

                XmlAttribute name = xdoc.CreateAttribute("name");
                XmlAttribute url = xdoc.CreateAttribute("url");

                name.Value = e.Values["name"].ToString();
                url.Value = e.Values["url"].ToString();

                oFeed.Attributes.Append(name);
                oFeed.Attributes.Append(url);

                FeedsList.AppendChild(oFeed);
                XmlDataSource4.Save();
                e.Cancel = true;
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void DetailsView2_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            XmlDocument xdoc = XmlDataSource4.GetXmlDocument();
            XmlElement oFeed = xdoc.SelectSingleNode("/feeds/feed[@name='" + e.CommandArgument + "']") as XmlElement;

            oFeed.Attributes["url"].Value = e.NewValues["url"].ToString(); ;

            XmlDataSource4.Save();
            e.Cancel = true;
            DetailsView2.ChangeMode(DetailsViewMode.ReadOnly);
            Response.Redirect(Request.RawUrl);
        }
    }
}