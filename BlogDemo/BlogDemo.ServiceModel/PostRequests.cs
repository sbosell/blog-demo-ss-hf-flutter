using BlogDemo.ServiceModel.Types;
using ServiceStack;
using System.Collections.Generic;

namespace BlogDemo.ServiceModel
{
    [Route("/external/ghost/posts")]
    public class GhostPostsProxyRequest : GhostPagedRequest, IReturn<GhostPosts>
    {
        
    }

    public class GhostPagedRequest
    {
        public int Page { get;set;}
        public int Limit { get;set;}

       
        public GhostPagedRequest() {
            Page = 1;
            Limit = 15;
        }
    }
   
}
