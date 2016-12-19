using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechGeeks.Account
{
    public partial class Transactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["userid"].DefaultValue = Context.User.Identity.GetUserId();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_insertReview", con))
                {
                    string data = (GridView1.Rows[e.RowIndex].FindControl("data") as TextBox).Text;
                    if (data == null || data.Length == 0)
                        return;

                    cmd.CommandType = CommandType.StoredProcedure;

                    string productId = (GridView1.Rows[e.RowIndex].FindControl("productIdLabel") as Label).Text;
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.Parameters.AddWithValue("@UserId", Context.User.Identity.GetUserId());
                    cmd.Parameters.AddWithValue("@Review", data);
                    con.Open();
                    cmd.ExecuteNonQuery();

                    e.Cancel = true;
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception) { }
        }
    }
}