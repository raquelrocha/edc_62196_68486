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
using TechGeeks.WebServices;

namespace TechGeeks.Admin
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
                    cmd.Parameters.AddWithValue("@PointsLimit", (GridView1.FooterRow.FindControl("newPointsLimit") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@Price", (GridView1.FooterRow.FindControl("newPrice") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@Short", (GridView1.FooterRow.FindControl("newShort") as TextBox).Text);
                    cmd.Parameters.AddWithValue("@LaunchDate", (GridView1.FooterRow.FindControl("newLaunchDate") as TextBox).Text);
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
                    cmd.Parameters.AddWithValue("@PointsLimit", e.NewValues["PointsLimit"] == null ? 0 : e.NewValues["PointsLimit"]);
                    cmd.Parameters.AddWithValue("@Price", e.NewValues["Price"]);
                    cmd.Parameters.AddWithValue("@Short", e.NewValues["Short"] == null ? "" : e.NewValues["Short"]);
                    cmd.Parameters.AddWithValue("@LaunchDate", e.NewValues["LaunchDate"]);
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

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            bool error = false;
            if (FileUploadControl.HasFile | FileUploadControl.HasFiles)
            {
                try
                {
                    string inputContent = "";
                    StatusLabel.Text = "Upload status: File uploaded!";
                    using (StreamReader inputStreamReader = new StreamReader(FileUploadControl.PostedFile.InputStream))
                    {
                        inputContent = inputStreamReader.ReadToEnd();
                    }
                    if (uploadType.SelectedValue.CompareTo("json") == 0)
                    {
                        XmlDocument xmlDoc = JsonConvert.DeserializeXmlNode(inputContent);
                        using (var stringWriter = new StringWriter())
                        using (var xmlTextWriter = XmlWriter.Create(stringWriter))
                        {
                            xmlDoc.WriteTo(xmlTextWriter);
                            xmlTextWriter.Flush();
                            inputContent = stringWriter.GetStringBuilder().ToString();
                        }
                    }

                    int val = inputContent.IndexOf("<?xml");
                    if (val != -1)
                        inputContent = inputContent.Remove(val, inputContent.IndexOf("?>") + 2 - val);
                    inputContent = inputContent.Replace("<List>", "").Replace("</List>", "");
                    string[] lista = Regex.Split(inputContent, "<Product>");
                    
                    if (lista.Length == 0)
                    {
                        StatusLabel.Text = "Couldn't find any data";
                        return;
                    }
                    string xml;
                    int i = 0;
                    if (cb_dump.Checked)
                    {
                        string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        SqlConnection con = new SqlConnection(constring);
                        using (SqlCommand cmd = new SqlCommand("sp_clearProducts", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    foreach (string s in lista)
                    {
                        if (!s.Contains("</Product>"))
                            continue;
                        xml = "<Product>" + s;
                        i++;
                        try { 
                            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                            SqlConnection con = new SqlConnection(constring);
                            using (SqlCommand cmd = new SqlCommand("sp_insertProductXML", con))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@data", xml);
                                con.Open();
                                cmd.ExecuteNonQuery();
                            }
                        } catch (Exception ex)
                        {
                            error = true;
                            StatusLabel.Text += "Iteration "+i+" failed to execute, error: " + ex.Message+"\r\nXML: "+xml;
                        }
                    }
                }
                catch (Exception ex)
                {
                    error = true;
                    StatusLabel.Text = "The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            if (!error)
                Response.Redirect(Request.RawUrl);
        }

        protected void exportBtn_Click(object sender, EventArgs e)
        {
            GetDump service = new GetDump();
            if (exportType.SelectedValue.CompareTo("json") == 0) {
                Response.AddHeader("Content-Disposition", "attachment; filename=dump.json");
                Response.Write(service.GetProductsJSON());
                Response.ContentType = "application/json";
            } else {
                Response.AddHeader("Content-Disposition", "attachment; filename=dump.xml");
                Response.Write(service.GetProductsXML().OuterXml);
                Response.ContentType = "application/xml";
            }
            Response.End();
        }
    }
}