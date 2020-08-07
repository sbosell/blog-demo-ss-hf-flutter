using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Funq;
using ServiceStack;
using ServiceStack.Configuration;
using BlogDemo.ServiceInterface;
using ServiceStack.Script;
using ServiceStack.Web;
using System;
using ServiceStack.Text;
using ServiceStack.Logging;
using System.IO;

namespace BlogDemo
{
    public class Startup : ModularStartup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public new void ConfigureServices(IServiceCollection services)
        {
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseServiceStack(new AppHost(Configuration)
            {
                AppSettings = new NetCoreAppSettings(Configuration)
            });
        }
    }

    public class AppHost : AppHostBase
    {
        private IConfiguration _coreConfig;
        public AppHost(IConfiguration coreConfig) : base("BlogDemo", typeof(GhostProxyService).Assembly) { 
            _coreConfig = coreConfig;
            }

        // Configure your AppHost with the necessary configuration and dependencies your App needs
        public override void Configure(Container container)
        {
            Plugins.Add(new SharpPagesFeature()); // enable server-side rendering, see: https://sharpscript.net/docs/sharp-pages

            // This is already done for you however in many cases you may want to add
            // your own custom items that will be a part of this cascading app settings provider
            MultiAppSettingsBuilder multiAppSettingsBuilder = new MultiAppSettingsBuilder();
            multiAppSettingsBuilder
                .AddNetCore(_coreConfig); // https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1#default-configuration
               
            // You can add text files or your own dictionary of custom values if you want

            AppSettings = multiAppSettingsBuilder.Build();

            SetConfig(new HostConfig
            {
               UseCamelCase= true,
                UseSameSiteCookies = true,
                AddRedirectParamsToQueryString = true,
                DebugMode = AppSettings.Get(nameof(HostConfig.DebugMode), HostingEnvironment.IsDevelopment()),
            });

            var test = AppSettings.Get<string>("GhostApi:ContentKey");

           
        }

       
    }
}
