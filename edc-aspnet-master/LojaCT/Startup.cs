using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LojaCT.Startup))]
namespace LojaCT
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
