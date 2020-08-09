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
using ServiceStack.OrmLite;
using ServiceStack.Data;
using BlogDemo.ServiceModel.Types;
using ServiceStack.Admin;
using BlogDemo.ServiceModel;
using Hangfire;
using Hangfire.Storage.SQLite;
using ServiceStack.Host;

namespace BlogDemo
{

    public class ContainerJobActivator : JobActivator
    {
        private Container _container;

        public ContainerJobActivator(Container container)
        {
            _container = container;
        }

        public override object ActivateJob(Type type)
        {
            return _container.Resolve(type);
        }
    }
    public class Startup : ModularStartup
    {
        private AppHost appHost;

        IServiceCollection serviceCollection;
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public new void ConfigureServices(IServiceCollection services)
        {
           
         
           services.AddHangfire(configuration => configuration
          .UseSimpleAssemblyNameTypeSerializer()
          .UseRecommendedSerializerSettings()
          .UseSQLiteStorage());
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, IServiceProvider serviceProvider)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            appHost = new AppHost(Configuration)
            {
                AppSettings = new NetCoreAppSettings(Configuration)
            };
          
            app.UseHangfireDashboard();

            app.UseServiceStack(appHost);

         

            app.UseHangfireServer(new BackgroundJobServerOptions() {
                Activator = new ContainerJobActivator(appHost.Container)
            });

          
           // JobStorage.Current = new SQLiteStorage();

          
            RecurringJob.AddOrUpdate<ReportService>(x=> x.Any(new DailyPostViewRequest() { Date = DateTime.UtcNow.AddDays(-1)}), Cron.Daily(0));

        }
    }

    public class AppHost : AppHostBase
    {
        private IConfiguration _coreConfig;
        public AppHost(IConfiguration coreConfig) : base("BlogDemo", typeof(GhostProxyService).Assembly) { 
            _coreConfig = coreConfig;
            }


        public override IServiceGateway GetServiceGateway(IRequest req) =>
            base.GetServiceGateway(req ?? new BasicRequest());

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
            JsConfig.TreatEnumAsInteger = true;

            SetConfig(new HostConfig
            {
               UseCamelCase= true,
                UseSameSiteCookies = true,
                AddRedirectParamsToQueryString = true,
                DebugMode = AppSettings.Get(nameof(HostConfig.DebugMode), HostingEnvironment.IsDevelopment()),
              
            });

            // for our app we will use an inmemory database.  This can be replaced with no
            // code changes for sql server, mysql or any of the ormlite providers
        
            Plugins.Add(new AutoQueryDataFeature(){
                MaxLimit = int.MaxValue
            });

            Plugins.Add(new AdminFeature());
            container.Register<IDbConnectionFactory>(c => new OrmLiteConnectionFactory(":memory:", SqliteDialect.Provider));

            using (var db = container.Resolve<IDbConnectionFactory>().Open())
            { 
                    db.CreateTableIfNotExists<PostLog>();   
            }

         

            GatewayRequestFilters.Add((req, dto) =>
            {
                if (dto is PostRequest || dto is PostQueryRequest)
                {
                    using (var db = Resolve<IDbConnectionFactory>().Open())
                    {
                        using (var trans = db.OpenTransaction())
                        {
                            db.Insert<PostLog>(new PostLog()
                            {
                                EntryDate = DateTime.UtcNow,
                                Identifier = (dto is PostRequest) ? ((PostRequest)dto).Id : string.Empty,
                                RequestType = dto.ToString(),
                                FilterType = FilterType.GatewayFilter
                            });
                            trans.Commit();
                        }
                    }
                }
            });

            GlobalRequestFilters.Add((req, res, dto) =>
            {
                if (dto is PostRequest || dto is PostQueryRequest)
                {
                    using (var db = Resolve<IDbConnectionFactory>().Open())
                    {
                        using (var trans = db.OpenTransaction()) { 
                            db.Insert<PostLog>(new PostLog() { 
                                EntryDate = DateTime.UtcNow, 
                                Identifier = (dto is PostRequest) ? ((PostRequest)dto).Id : string.Empty,
                                RequestType = dto.GetType().ToString(),
                                FilterType = FilterType.RequestFilter
                            });
                            trans.Commit();
                        }
                    }
                }
            });

            container.AddTransient<IServiceGatewayFactory>(() => new CustomServiceGatewayFactory());
           }

       
    }

    public class CustomServiceGatewayFactory : ServiceGatewayFactoryBase
    {
        public override IServiceGateway GetGateway(Type requestType)
        {
            var isLocal = HostContext.Metadata.RequestTypes.Contains(requestType);
            var gateway = isLocal
                ? (IServiceGateway)base.localGateway
                : new JsonServiceClient("");  // TBD in the future
            return gateway;
        }
    }
}
