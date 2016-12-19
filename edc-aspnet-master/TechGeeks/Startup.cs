using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TechGeeks.Startup))]
namespace TechGeeks
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
