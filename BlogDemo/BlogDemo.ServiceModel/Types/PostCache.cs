using ServiceStack.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogDemo.ServiceModel.Types
{
    
    public enum FilterType
    {
        NotSet=0,
        RequestFilter=1,
        GatewayFilter=2
    }
    public class PostLog
    {
        [PrimaryKey]
        [AutoIncrement]
        public long Id { get;set;}

        public FilterType FilterType { get;set;}
        public string RequestType { get;set;}
        public DateTime EntryDate { get;set;}
        // Ormlite will blog this value
        // we could build out a table structure on all the classes
        // but let's keep it simple for this exercise
        public string Identifier { get;set;}
    }


    public class SchedulerLog
    {
        [PrimaryKey]
        [AutoIncrement]
        public long Id { get;set;}
        public DateTime LastRunDateTime { get;set;}
    }

  
}
