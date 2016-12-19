using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechGeeks.Models;

namespace TechGeeks.Admin
{

    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddList = (DropDownList)e.Row.FindControl("DropDownList1");

                    Models.ApplicationDbContext context = new ApplicationDbContext();
                    var roleStore = new RoleStore<IdentityRole>(context);

                    var myRoles = new List<string>();

                    var roleMgr = new RoleManager<IdentityRole>(roleStore);
                    foreach (var role in roleMgr.Roles.ToList())
                    {
                        myRoles.Add(role.Name);
                    }
                    ddList.DataSource = myRoles;
                    ddList.DataBind();

                    DataRowView dr = e.Row.DataItem as DataRowView;
                    ddList.SelectedValue = dr["role"].ToString();
                }
            }
        }


        protected void UserRoleGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (UserRoleGrid.Rows[e.RowIndex].RowType == DataControlRowType.DataRow)
            {
                if ((UserRoleGrid.Rows[e.RowIndex].RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddList = (DropDownList)UserRoleGrid.Rows[e.RowIndex].FindControl("DropDownList1");
                    //ddList.SelectedValue.ToString()
                    var myRow = (Label)UserRoleGrid.Rows[e.RowIndex].FindControl("email");

                    string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(constring);
                    using (SqlCommand cmd = new SqlCommand("sp_updateUserRole", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@email", myRow.Text.ToString());
                        cmd.Parameters.AddWithValue("@role", ddList.SelectedValue.ToString());
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }
    }
}