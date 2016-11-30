using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Trabalho3
{
    public partial class Aggregator : System.Web.UI.Page
    {
        int countNews;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected string DisplayFeedItem(SyndicationItem item)  // linked to listview item template 
        {

            string itemLink = "#";
            if (item.Links.Count > 0)
                itemLink = item.Links[0].Uri.ToString();
            return string.Format(@"<h4><a href=""{0}"" target=""_blank"">{1}</a></h4> ({2:d})<br /><br /><b>{4}</b><p>{3}</p><br/><p>Fonte: {5}</p>",
                itemLink,
                item.Title.Text,
                FormatPublishDate(item.PublishDate.DateTime),
                item.Summary.Text,
                item.Categories[0].Name.ToString(),
                item.Links[0].Uri.Authority.ToString());
        }

        protected string FormatPublishDate(DateTime publishDate)  // no formato que achar mais relavante
        {
            TimeSpan delta = DateTime.Now.Subtract(publishDate);
            if (delta.Days > 7)
                return publishDate.ToShortDateString();
            else if (delta.Days > 1)
                return string.Format("{0} dias atrás", delta.Days);
            else if (delta.Days == 1)
                return string.Format("Ontem", delta.Days);
            else if (delta.Hours > 1)
                return string.Format("{0} horas atrás", delta.Hours);
            else if (delta.Hours == 1)
                return string.Format("1 hora atrás", delta.Hours);
            else if (delta.Minutes > 1)
                return string.Format("{0} minutos atrás", delta.Minutes);
            else if (delta.Minutes == 1)
                return string.Format("1 minuto atrás", delta.Minutes);
            else
                return "Há poucos segundos atrás";
        }

        public int CompareDates(SyndicationItem x, SyndicationItem y)
        {
            return y.PublishDate.CompareTo(x.PublishDate);
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            XmlDocument xdoc = XmlDataSourceFeedReader.GetXmlDocument();
            XmlNodeList testNull = xdoc.SelectNodes("feeds/feed[@url]");

            // brings all the selected checkbox at the time
            List<ListItem> selected = CheckBoxList1.Items.Cast<ListItem>()
                                                .Where(li => li.Selected)
                                                .ToList();

            List<SyndicationItem> allItems = new List<SyndicationItem>();

            countNews = 0;
            string url = "";
            for (int i = 0; i < testNull.Count; i++)
            {
                url = testNull.Item(i).Attributes["url"].Value;
                foreach (ListItem item in selected)
                {
                    //System.Diagnostics.Debug.WriteLine(item);
                    XmlElement testNull2 = xdoc.SelectSingleNode("feeds/feed[@name='" + item + "']") as XmlElement;
                    if (url == testNull2.Attributes["url"].Value)
                    {
                        //System.Diagnostics.Debug.WriteLine(url);
                        XmlReader reader1 = XmlReader.Create(url);
                        Rss20FeedFormatter formatter1 = new Rss20FeedFormatter();
                        formatter1.ReadFrom(reader1);
                        reader1.Close();

                        allItems.AddRange(formatter1.Feed.Items);
                        allItems.Sort(CompareDates);  // mostra os itens mais recentes de qualquer feed
                        break;
                    }
                }
            }

            //final feed
            SyndicationFeed feed = new SyndicationFeed();
            feed.Items = allItems;
            countNews += feed.Items.Count<SyndicationItem>();
            count_news.Text = "[" + countNews + "]";

            ListView1.DataSource = feed.Items;
            ListView1.DataBind();
        }
    }
}