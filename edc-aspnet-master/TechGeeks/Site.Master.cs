using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using TechGeeks.Models;
using TechGeeks.Logic;
using System.Xml;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Xsl;
using System.IO;
using System.Xml.XPath;
using System.Text;

namespace TechGeeks
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_PreRender(object sender, EventArgs e)
        {
            // If user logged in and still has stuff on cache
            if (Session["cart"] != null && 
                System.Web.HttpContext.Current.User != null &&
                System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                ShoppingCart c = (ShoppingCart)Session["cart"];
                foreach (ShoppingCartObject obj in c.list)
                {
                    string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(constring);
                    using (SqlCommand cmd = new SqlCommand("sp_insertProductCart", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@productId", obj.productId);
                        cmd.Parameters.AddWithValue("@quantity", obj.quantity);
                        cmd.Parameters.AddWithValue("@userId",
                            Context.User.Identity.GetUserId());
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                Session["cart"] = null;
            }

            // Dynamic representation of the Shopping Cart
            XmlDocument feed = new XmlDocument();
            string data = "<Data><ShoppingCart>";
            if ((System.Web.HttpContext.Current.User != null) &&
                System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                string xmlDocument = "";
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_getUsersDataXML", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userId",
                        Context.User.Identity.GetUserId());
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                        xmlDocument += reader.GetString(0);
                }
                XmlDocument temp = new XmlDocument();
                temp.LoadXml(xmlDocument);
                foreach(XmlNode a in temp.SelectNodes("/Data/ShoppingCart/Product"))
                {
                    data += getProductFromCart(Convert.ToInt32(a.Attributes["id"].Value),
                                        Convert.ToInt32(a.Attributes["quantity"].Value));                
                }
            }
            else
            {
                if (Session["cart"] != null)
                {
                    ShoppingCart cart = (ShoppingCart)Session["cart"];
                    foreach (ShoppingCartObject obj in cart.list)
                    {
                        data += getProductFromCart(obj.productId, obj.quantity);
                    }
                }
            }
            data += "</ShoppingCart></Data>";
            feed.LoadXml(data);
            cartNavbar.XPathNavigator = feed.CreateNavigator();
        }
        private string getProductFromCart(int id, int quantity)
        {
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            string data = "";
            using (SqlCommand cmd = new SqlCommand("sp_getProductXML", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productId", id);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                    data += reader.GetString(0);
            }
            return data;
        } 
        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void subscribeBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string email = emailSubscriber.Value;
                string constring = System.Configuration.ConfigurationManager.
                    ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_insertEmailNewsletter", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception) { }
            Response.Redirect(Request.RawUrl);
        }

        protected string getNumberPoints()
        {
            string points = "0";
            if ((System.Web.HttpContext.Current.User != null) &&
                System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_getUserPoints", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userId",
                        Context.User.Identity.GetUserId());
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                        points = reader.GetInt32(0).ToString();
                }
            }
            return points;
        }
    }

}