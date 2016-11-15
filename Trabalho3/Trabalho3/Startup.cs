using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Trabalho3.Startup))]
namespace Trabalho3
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
