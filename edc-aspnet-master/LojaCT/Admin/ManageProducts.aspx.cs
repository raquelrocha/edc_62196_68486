using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using LojaCT.WebServices;

namespace LojaCT.Admin
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            try
            {
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_insertProduct", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", (GridView1.FooterRow.FindControl("newName") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@Category", (GridView1.FooterRow.FindControl("newCategory") as DropDownList).SelectedValue);
                    cmd.Parameters.AddWithValue("@PointsLimit", "0");
                    cmd.Parameters.AddWithValue("@Price", (GridView1.FooterRow.FindControl("newPrice") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@Short", (GridView1.FooterRow.FindControl("newShort") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@LaunchDate", "10/10/16");
                    cmd.Parameters.AddWithValue("@Description", "");
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception) { }
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_updateProduct", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", GridView1.DataKeys[e.RowIndex].Value);
                    cmd.Parameters.AddWithValue("@Name", e.NewValues["Name"]);
                    cmd.Parameters.AddWithValue("@Category", e.NewValues["Category"]);
                    cmd.Parameters.AddWithValue("@PointsLimit", 0);
                    cmd.Parameters.AddWithValue("@Price", e.NewValues["Price"]);
                    cmd.Parameters.AddWithValue("@Short", e.NewValues["Short"] == null ? "" : e.NewValues["Short"]);
                    cmd.Parameters.AddWithValue("@LaunchDate", "10/10/16");
                    cmd.Parameters.AddWithValue("@Description", e.OldValues["Description"] == null ? "" : e.OldValues["Description"]);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception) { }
            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_deleteProduct", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", GridView1.DataKeys[e.RowIndex].Value);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        
    }
}