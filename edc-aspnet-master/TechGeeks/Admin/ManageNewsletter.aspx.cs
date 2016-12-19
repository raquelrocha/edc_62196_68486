using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace TechGeeks.Admin
{
    public partial class ManageNewsletter : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string xmlDocument = "";
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("[sp_getSubscribersNewsletter]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                    xmlDocument += reader.GetString(0);
            }
            XmlDataSourceNewsletter.Data = xmlDocument;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string constring = System.Configuration.ConfigurationManager.
                ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_deleteEmailNewsletter", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", e.Values["value"]);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void sendEmailsBtn_Click(object sender, EventArgs e)
        {
            string destinations = "";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                destinations += GridView1.Rows[i].Cells[0].Text;
                if (i != GridView1.Rows.Count)
                    destinations += ", ";
            }
            emailMessage.InnerHtml = "Emails were sent with success to: <br />"+destinations;
        }
    }
}