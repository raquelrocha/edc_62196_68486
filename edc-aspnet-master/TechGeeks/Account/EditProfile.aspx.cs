using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechGeeks.Models;

namespace TechGeeks.Account
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            if (!IsPostBack)
            {
                // Determine the sections to render
                if (HasPassword(manager))
                {
                    changePasswordHolder.Visible = true;
                }
                else
                {
                    setPassword.Visible = true;
                    changePasswordHolder.Visible = false;
                }

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl(Request.RawUrl);
                }
            }

            SqlDataSource1.SelectParameters["userid"].DefaultValue = Context.User.Identity.GetUserId();
            SqlDataSource1.DataBind();
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            using (SqlCommand cmd = new SqlCommand("sp_updateUserDetails", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", Context.User.Identity.GetUserId());
                cmd.Parameters.AddWithValue("@fullname", e.NewValues["FullName"] == null ? "" : e.NewValues["FullName"]);
                cmd.Parameters.AddWithValue("@birthdate", e.NewValues["BirthDate"] == null ? null : e.NewValues["BirthDate"]);
                cmd.Parameters.AddWithValue("@nif", e.NewValues["NIF"] == null ? "" : e.NewValues["NIF"]);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                IdentityResult result = manager.ChangePassword(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text);
                if (result.Succeeded)
                {
                    var user = manager.FindById(User.Identity.GetUserId());
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    AddErrors(result);
                }
            }
        }

        protected void SetPassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Create the local login info and link the local account to the user
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                IdentityResult result = manager.AddPassword(User.Identity.GetUserId(), password.Text);
                if (result.Succeeded)
                {
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    AddErrors(result);
                }
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }
    }
}