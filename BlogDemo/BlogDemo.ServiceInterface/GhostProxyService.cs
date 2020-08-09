using BlogDemo.ServiceModel;
using BlogDemo.ServiceModel.Types;
using ServiceStack;
using ServiceStack.Configuration;
using ServiceStack.Data;
using ServiceStack.OrmLite;
using ServiceStack.Text;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlogDemo.ServiceInterface
{
    public class GhostProxyService : Service
    {
        public IDbConnectionFactory DbFactory { get;set;}
        public IAppSettings AppSettings { get;set;}
        public object Get(GhostPostsProxyRequest req)
        {
            GhostPosts posts = null;
           
            var json = $"{AppSettings.Get<string>("GhostApi:BaseUrl")}/posts/?key={AppSettings.Get<string>("GhostApi:ContentKey")}&include=authors,tags&page={req.Page}&limit={req.Limit}".GetJsonFromUrl();
            using (JsConfig.With(new ServiceStack.Text.Config {
                    TextCase = TextCase.SnakeCase,
                    PropertyConvention = PropertyConvention.Lenient
}               ))
            {
                posts = json.FromJson<GhostPosts>();
            }
           
            return posts;
        }

        private GhostPosts GhostPostRequest(PostQueryRequest req)
        {
            req.Skip = req.Skip ?? 0;
            req.Take = req.Take ?? 15;
            var page = Math.Ceiling((double)(req.Skip.Value / req.Take.Value)) + 1;  // 10 / 5 = 2, 10 / 6 = 2
            var url = $"{AppSettings.Get<string>("GhostApi:BaseUrl")}/posts/?key={AppSettings.Get<string>("GhostApi:ContentKey")}&include=authors,tags";
            url = url.AddQueryParam("page", page).AddQueryParam("limit", req.Take);
            url = !String.IsNullOrEmpty(req.Filter) ? url.AddQueryParam("filter", req.Filter) : url;
            url = !String.IsNullOrEmpty(req.OrderBy) && req.OrderBy.StartsWith("-") ? url.AddQueryParam("order", $"{req.OrderByDesc} desc") : url;

             var json = url.GetJsonFromUrl();

            using (GhostJsConfig.With())
            {
                return  json.FromJson<GhostPosts>();
            }
        }

        [CacheResponse(Duration = 10)]
        public object Get(PostQueryRequest req)
        {
               GhostPosts posts = null;
         
               posts  = GhostPostRequest(req);

               return new QueryResponse<Post>()
               {
                   Results = posts.Posts,
                   Offset = req.Skip.Value * req.Take.Value,
                   Total = posts.Meta.Pagination.Total
               };
           
        }
        /// <summary>
        /// Returns a post from the Ghost Api.  The Api internally does a filter so we will just wrap our query request with a filter.
        /// </summary>
        /// <param name="req"></param>
        /// <returns></returns>
        [CacheResponse(Duration =10)]
        public object Get(PostRequest req)
        {
             var posts = (QueryResponse<Post>) Get(new PostQueryRequest() { Filter = $"id:{req.Id}" });
             if (posts.Results.Count != 1) throw HttpError.NotFound($"Post does not exist");
             var post = posts.Results[0];
            using (var db = DbFactory.Open())
            {             
                post.ViewsToday = db.Count<PostLog>(x=> x.RequestType == typeof(PostRequest).ToString() && x.EntryDate>=DateTime.UtcNow.Date && x.EntryDate<DateTime.UtcNow.Date.AddDays(1));
            }

            return post;
           
        }
    }
    
}

//https://codepen.io/cristinaconacel/pen/dgmjKK
//"https://sambosell.ghost.io/ghost/api/v3/content/posts?key="
//filter=featured:true
//filter=tag:getting-started
//limit=5,limit=all
//page=1
