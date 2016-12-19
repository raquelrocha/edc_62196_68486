using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using TechGeeks.Models;

namespace TechGeeks.Logic
{
    internal class RoleActions
    {
        internal void AddUserAndRole()
        {
            // Access the application context and create result variables.
            Models.ApplicationDbContext context = new ApplicationDbContext();
            IdentityResult IdRoleResult;
            IdentityResult IdUserResult;

            // Create a RoleStore object by using the ApplicationDbContext object. 
            // The RoleStore is only allowed to contain IdentityRole objects.
            var roleStore = new RoleStore<IdentityRole>(context);

            // Create a RoleManager object that is only allowed to contain IdentityRole objects.
            // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            // Then, you create the "canEdit" role if it doesn't already exist.
            if (!roleMgr.RoleExists("administrator"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "administrator" });
            }
            // Then, you create the "canEdit" role if it doesn't already exist.
            if (!roleMgr.RoleExists("manager"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "manager" });
            }
            // Then, you create the "canEdit" role if it doesn't already exist.
            if (!roleMgr.RoleExists("member"))
            {
                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "member" });
            }
            // Create a UserManager object based on the UserStore object and the ApplicationDbContext  
            // object. Note that you can create new objects and use them as parameters in
            // a single line of code, rather than using multiple lines of code, as you did
            // for the RoleManager object.
            var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var appUser = new ApplicationUser
            {
                UserName = "adm@techgeeks.pt",
                Email = "adm@techgeeks.pt"
            };
            IdUserResult = userMgr.Create(appUser, "pass1234");

            // If the new "canEdit" user was successfully created, 
            // add the "canEdit" user to the "canEdit" role. 
            if (!userMgr.IsInRole(userMgr.FindByEmail("adm@techgeeks.pt").Id, "administrator"))
            {
                IdUserResult = userMgr.AddToRole(userMgr.FindByEmail("adm@techgeeks.pt").Id, "administrator");
            }
        }
    }
}