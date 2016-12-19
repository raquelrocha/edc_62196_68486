using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Xml;

namespace TechGeeks.WebServices
{
    /// <summary>
    /// Summary description for GetDump
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class GetDump : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Xml)]
        public XmlDocument GetProductsXML()
        {
            string xmlString = "";
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_getAllProducts", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                int rows = 0;
                while (reader.Read()) { 
                    xmlString += reader.GetString(0);
                    rows++;
                }
                if (rows > 1)
                    xmlString = "<List>" + xmlString + "</List>";
            }
            XmlDocument xml = new XmlDocument();
            xml.LoadXml(xmlString);
            return xml;
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json)]
        public string GetProductsJSON()
        {
            string data = JsonConvert.SerializeXmlNode(GetProductsXML());
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            return data;
        }
    }
}
