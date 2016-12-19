using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TechGeeks.Shop
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            string data = "<Data><ShoppingCart>";
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
            foreach (XmlNode a in temp.SelectNodes("/Data/ShoppingCart/Product"))
            {
                data += getProductFromCart(Convert.ToInt32(a.Attributes["id"].Value),
                                    Convert.ToInt32(a.Attributes["quantity"].Value));
            }
            data += "</ShoppingCart></Data>";
            XmlDataSourceShoppingCart.Data = data;
            XmlDataSourceShoppingCart.DataBind();

            if (GridView1.Rows.Count == 0)
                paymentMethod.Visible = false;
            else
                paymentMethod.Visible = true;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_modifyProductCartQuantity", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@productid", Convert.ToInt32(e.CommandArgument));
                cmd.Parameters.AddWithValue("@userid", Context.User.Identity.GetUserId());
                if (e.CommandName == "Plus")
                    cmd.Parameters.AddWithValue("@incrementQuantity", 1);
                else if (e.CommandName == "Minus")
                    cmd.Parameters.AddWithValue("@incrementQuantity", -1);
                else if (e.CommandName == "Remove")
                    cmd.Parameters.AddWithValue("@incrementQuantity", 0);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_checkoutShoppingCart", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", Context.User.Identity.GetUserId());
                cmd.Parameters.AddWithValue("@usePoints", usePoints.Checked);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("~/Shop/BoughtComplete");
        }
    }
}