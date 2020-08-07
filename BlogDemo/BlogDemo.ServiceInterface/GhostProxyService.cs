using BlogDemo.ServiceModel;
using BlogDemo.ServiceModel.Types;
using ServiceStack;
using ServiceStack.Configuration;
using ServiceStack.Text;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogDemo.ServiceInterface
{
    public class GhostProxyService : Service
    {
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
    }
}


//"https://sambosell.ghost.io/ghost/api/v3/content/posts?key="
//filter=featured:true
//filter=tag:getting-started
//limit=5,limit=all
//page=1
