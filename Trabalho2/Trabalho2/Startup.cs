using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Trabalho2.Startup))]
namespace Trabalho2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
