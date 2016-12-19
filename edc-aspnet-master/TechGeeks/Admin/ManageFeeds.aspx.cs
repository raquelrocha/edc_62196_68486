using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechGeeks.Admin
{
    public partial class ManageFeeds : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
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
            XmlDataSourceFeeds.Data = xmlDocument;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            try
            {
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_insertRSSFeed", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@rss", (GridView1.FooterRow.FindControl("newUrl") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@title", (GridView1.FooterRow.FindControl("newTitle") as TextBox).Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception) { }
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_deleteRSSFeed", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@title", GridView1.DataKeys[e.RowIndex].Value);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_updateRSSFeed", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@title", GridView1.DataKeys[e.RowIndex].Value);
                    cmd.Parameters.AddWithValue("@rss", e.NewValues["url"]);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception) { }
            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

    }
}