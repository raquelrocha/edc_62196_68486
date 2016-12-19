using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace TechGeeks
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            routes.MapPageRoute("shop-category",
                "Shop/Category/{category}",
                "~/Shop/Category.aspx");
            routes.MapPageRoute("shop-reviews",
                "Shop/Reviews/{productid}",
                "~/Shop/Reviews.aspx");
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);    
        }
    }
}
