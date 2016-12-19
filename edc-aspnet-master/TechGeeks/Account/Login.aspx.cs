using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using TechGeeks.Models;
using System.Data.SqlClient;
using System.Data;
using TechGeeks.Logic;
using Microsoft.AspNet.Identity.EntityFramework;

namespace TechGeeks.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            /*if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }*/
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

                // This doen't count login failures towards account lockout
                // To enable password failures to trigger lockout, change to shouldLockout: true
                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

                switch (result)
                {
                    case SignInStatus.Success:
                        Response.Redirect("~");
                        break;
                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;
                    case SignInStatus.RequiresVerification:
                        Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                        Request.QueryString["ReturnUrl"],
                                                        RememberMe.Checked),
                                          true);
                        break;
                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Invalid login attempt";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdUserResult;
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            DateTime dateValue;
            bool noDate = false;
            if (!DateTime.TryParse(BirthdayRegister.Text, out dateValue))
                noDate = true;
            ApplicationUser user;
            if (noDate)
            {
                user = new ApplicationUser()
                {
                    UserName = EmailRegister.Text,
                    Email = EmailRegister.Text,
                    NIF = NIFRegister.Text,
                    FullName = FullNameRegister.Text
                };
            } else
            {
                user = new ApplicationUser()
                {
                    UserName = EmailRegister.Text,
                    Email = EmailRegister.Text,
                    BirthDate = dateValue,
                    NIF = NIFRegister.Text,
                    FullName = FullNameRegister.Text
                };
            }

            try
            {
                IdentityResult result = manager.Create(user, PasswordRegister.Text);

                if (result.Succeeded)
                {
                    if (ReferralRegister.Text != null && ReferralRegister.Text != "")
                    {
                        string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                        SqlConnection con = new SqlConnection(constring);
                        using (SqlCommand cmd = new SqlCommand("sp_incrementPoints", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@referrer", ReferralRegister.Text);
                            cmd.Parameters.AddWithValue("@points", 10);
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    if (!userMgr.IsInRole(user.Id, "member"))
                        IdUserResult = userMgr.AddToRole(user.Id, "member");

                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    ErrorRegister.Text = result.Errors.FirstOrDefault();
                }
            }
            catch (Exception) { }
        }
    }
}