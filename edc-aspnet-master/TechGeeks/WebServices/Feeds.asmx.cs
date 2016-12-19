using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Web.Script.Services;
using System.Web.Services;
using System.Xml;

namespace TechGeeks.WebServices
{
    /// <summary>
    /// Summary description for Feeds
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Feeds : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Xml)]
        public XmlDocument GetAggregatedFeedsWithFilter(string filter)
        {
            XmlDocument doc = GetAggregatedFeeds();

            string xmlString = "";

            XmlNodeList nodes = doc.SelectNodes("rss/channel/item");
            foreach (XmlNode n in nodes)
            {
                if (n.InnerXml.Contains(filter))
                    xmlString += "<item>" + n.InnerXml + "</item>";
            }

            xmlString = "<channel><title>Latest Articles from PC Advisor</title>" +
                "<link>http://localhost:1825/WebServices/Feeds.asmx/GetAggregatedFeedsWithFilter</link>" +
                "<language>en-gb</language>" +
                "<pubDate>" + DateTime.Now + "</pubDate>" +
                "<description>Latest aggregated news from TechGeeks</description>" +
                   "<managingEditor>diogo@ua.pt</managingEditor>" +
                "<webMaster> diogo@ua.pt(Webmaster) </webMaster>" + xmlString + "</channel>";

            xmlString = "<rss xmlns:content=\"http://purl.org/rss/1.0/modules/content/\" " +
                "xmlns:dc=\"http://purl.org/dc/elements/1.1/\" version=\"2.0\">" +
                xmlString + "</rss>";

            XmlDocument xml = new XmlDocument();
            xml.LoadXml(xmlString);
            return xml;
        }


        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Xml)]
        public XmlDocument GetAggregatedFeeds()
        {
            int ret = -1;
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_feedNeedsRefresh", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter returnParameter = cmd.Parameters.Add("RetVal", SqlDbType.Int);
                returnParameter.Direction = ParameterDirection.ReturnValue;
                con.Open();
                cmd.ExecuteNonQuery();

                ret = (int)returnParameter.Value;
            }

            if (ret > 0)
            {
                con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_insertAggregatedFeeds", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@data", generateAggregatedFeeds().OuterXml);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            string xmlDocument = "";
            con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_getAggregatedFeed", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                    xmlDocument += reader.GetString(0);
            }
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(xmlDocument);
            return doc;

        }

        private XmlDocument generateAggregatedFeeds()
        {
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string xmlDocument = "";
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("[sp_getRSSFeeds]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                    xmlDocument += reader.GetString(0);
            }
            XmlDocument feeds = new XmlDocument();
            feeds.LoadXml(xmlDocument);
            XmlNodeList feedNodes = feeds.SelectNodes("Feeds/Feed/@url");

            string xmlString = "";

            foreach (XmlNode node in feedNodes)
            {
                try
                {
                    string url = node.Value;
                    WebClient client = new WebClient();
                    string rssFeed = client.DownloadString(url);

                    XmlDocument doc = new XmlDocument();
                    doc.LoadXml(rssFeed);

                    XmlNodeList nodes = doc.SelectNodes("rss/channel/item");
                    foreach (XmlNode n in nodes)
                    {
                        xmlString += "<item>" + n.InnerXml + "</item>";
                    }
                }
                catch (Exception e) { }
            }

            xmlString = "<channel><title>Latest Articles from PC Advisor</title>" +
                "<link>http://localhost:1825/WebServices/Feeds.asmx/GetAggregatedFeeds</link>" +
                "<language>en-gb</language>" +
                "<pubDate>" + DateTime.Now + "</pubDate>" +
                "<description>Latest aggregated news from TechGeeks</description>" +
                   "<managingEditor>diogo@ua.pt</managingEditor>" +
                "<webMaster> diogo@ua.pt(Webmaster) </webMaster>" + xmlString + "</channel>";

            xmlString = "<rss xmlns:content=\"http://purl.org/rss/1.0/modules/content/\" " +
                "xmlns:dc=\"http://purl.org/dc/elements/1.1/\" version=\"2.0\">" +
                xmlString + "</rss>";

            XmlDocument xml = new XmlDocument();
            xml.LoadXml(xmlString);
            return xml;
        }
    }
}
