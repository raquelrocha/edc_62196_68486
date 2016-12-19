using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TechGeeks
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AllNews_Click(sender, e);
        }
        protected void FilterFeed_Click(object sender, EventArgs e)
        {
            string filter = ((CommandEventArgs)e).CommandArgument.ToString();
            if (filter != null)
            {
                WebServices.Feeds service = new WebServices.Feeds();
                XmlDocument feed = service.GetAggregatedFeedsWithFilter(filter);

                Xml1.XPathNavigator = feed.CreateNavigator();
                Xml1.DataBind();
            }
        }

        protected void AllNews_Click(object sender, EventArgs e)
        {
            WebServices.Feeds service = new WebServices.Feeds();
            XmlDocument feed = service.GetAggregatedFeeds();

            Xml1.XPathNavigator = feed.CreateNavigator();
            Xml1.DataBind();

        }

        protected void SearchFilterFeed_Click(object sender, EventArgs e)
        {
            string filter = filterTextBox.Text;
            if (filter != null)
            {
                WebServices.Feeds service = new WebServices.Feeds();
                XmlDocument feed = service.GetAggregatedFeedsWithFilter(filter);

                Xml1.XPathNavigator = feed.CreateNavigator();
                Xml1.DataBind();
            }
        }
    }
}