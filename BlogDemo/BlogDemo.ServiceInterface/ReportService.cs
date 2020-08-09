using BlogDemo.ServiceModel;
using BlogDemo.ServiceModel.Types;
using PostmarkDotNet;
using ServiceStack;
using ServiceStack.Configuration;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Script;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogDemo.ServiceInterface
{
    public class ReportService : Service
    {
        private IAppSettings _appSettings { get;set;}
        private IDbConnectionFactory _dbConnectionFactory;
    
        public ReportService(IAppSettings appSettings, IDbConnectionFactory dbConnectionFactory)
        {
            _appSettings = appSettings;
            _dbConnectionFactory = dbConnectionFactory;
        }
        public void Any(DailyPostViewRequest req)
        {
            // we need a way to get all posts but for now let's just get the top 15
            var result = base.Gateway.Send(new PostQueryRequest() { Skip=0, Take=15 });
            var posts = result.Results;
            using (var db = _dbConnectionFactory.Open())
            {
                var q = db.From<PostLog>()
                    .Where(x => x.RequestType == typeof(PostRequest).ToString() &&
                        x.EntryDate >= req.Date &&
                        x.EntryDate < req.Date.AddDays(1))
                    .GroupBy(x => x.Identifier)
                    .Select(x => new  { x.Identifier, Total = Sql.Count("*")  });

                var results = db.Dictionary<string, int>(q);
               

                foreach (var p in posts)
                {
                  
                    p.ViewsToday = results.ContainsKey(p.Id) ? results[p.Id] : 0;
                };
            }

            var client = new PostmarkClient(_appSettings.Get<string>("PostmarkApi:ServerToken"));

            try
            {
                ScriptContext sc = new ScriptContext().Init();

               var template =  sc.RenderScript(@"
                  <table>
                      <tr><th>Title</th><th>Today's Views</th></tr>
                    {{#each post in posts}}
                      <tr>
                        <td>{{post.title}}</td><td>{{post.ViewsToday}}</td>
                      </tr>
                    {{/each}}
                    </table>
                ", new Dictionary<string, object>() {
                   {"posts", posts }
               });

                var sendResult =  client.SendMessageAsync(new PostmarkMessage() {
                     From = _appSettings.Get<string>("PostmarkApi:FromEmail"),
                     To = _appSettings.Get<string>("PostmarkApi:ToEmail"),
                    Subject =$"Daily Blog Post Report - {req.Date.ToString("yyyy-MM-dd")}",
                   HtmlBody =  template
                }).Result;

            
                if (sendResult.Status == PostmarkStatus.Success) { /* Handle success */ }
                else { /* Resolve issue.*/ }

            }
            catch (Exception ex)
            {
                // Calls to the client can throw an exception 
                // if the request to the API times out.
            }

        }
    }
}
