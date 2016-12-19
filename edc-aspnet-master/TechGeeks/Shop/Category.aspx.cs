using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechGeeks.Logic;

namespace TechGeeks.Shop
{
    public partial class Category : System.Web.UI.Page
    {
        private string category;
        protected void Page_Load(object sender, EventArgs e)
        {
            string category = Page.RouteData.Values["category"] as string;
            categoryTitle.Text = category;
        }

        public string getCategory
        {
            get { return category; }
        }

        public void sendToCheckout(object sender, CommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument.ToString());
            if ((System.Web.HttpContext.Current.User != null) &&
                System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_insertProductCart", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.Parameters.AddWithValue("@quantity", 1);
                    cmd.Parameters.AddWithValue("@userId",
                        Context.User.Identity.GetUserId());
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            else
            {
                if (Session["cart"] == null)
                    Session["cart"] = new ShoppingCart();
                ((ShoppingCart)Session["cart"]).addToCart(productId, 1);
            }
        }
    }
}