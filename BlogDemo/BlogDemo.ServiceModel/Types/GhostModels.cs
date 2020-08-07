using System;
using System.Collections.Generic;
using System.Text;

namespace BlogDemo.ServiceModel.Types
{
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
    public class Tag
    {
        
        public string Id { get; set; }

        
        public string Name { get; set; }

        
        public string Slug { get; set; }

        
        public object Description { get; set; }

        
        public object FeatureImage { get; set; }

        
        public string Visibility { get; set; }

        
        public object MetaTitle { get; set; }

        
        public object MetaDescription { get; set; }

        
        public string Url { get; set; }
    }

    public class Author
    {
        
        public string Id { get; set; }

        
        public string Name { get; set; }

        
        public string Slug { get; set; }

        
        public string ProfileImage { get; set; }

        
        public object CoverImage { get; set; }

        
        public object Bio { get; set; }

        
        public string Website { get; set; }

        
        public string Location { get; set; }

        
        public string Facebook { get; set; }

        
        public string Twitter { get; set; }

        
        public object MetaTitle { get; set; }

        
        public object MetaDescription { get; set; }

        
        public string Url { get; set; }
    }

    public class PrimaryAuthor
    {
        
        public string Id { get; set; }

        
        public string Name { get; set; }

        
        public string Slug { get; set; }

        
        public string ProfileImage { get; set; }

        
        public object CoverImage { get; set; }

        
        public object Bio { get; set; }

        
        public string Website { get; set; }

        
        public string Location { get; set; }

        
        public string Facebook { get; set; }

        
        public string Twitter { get; set; }

        
        public object MetaTitle { get; set; }

        
        public object MetaDescription { get; set; }

        
        public string Url { get; set; }
    }

    public class PrimaryTag
    {
        
        public string Id { get; set; }

        
        public string Name { get; set; }

        
        public string Slug { get; set; }

        
        public object Description { get; set; }

        
        public object FeatureImage { get; set; }

        
        public string Visibility { get; set; }

        
        public object MetaTitle { get; set; }

        
        public object MetaDescription { get; set; }

        
        public string Url { get; set; }
    }

    public class Post
    {
        
        public string Slug { get; set; }

        
        public string Id { get; set; }

        
        public string Uuid { get; set; }

        
        public string Title { get; set; }

        
        public string Html { get; set; }

        
        public string CommentId { get; set; }

        
        public string FeatureImage { get; set; }

        
        public bool Featured { get; set; }

        
        public string Visibility { get; set; }

        
        public DateTime CreatedAt { get; set; }

        
        public DateTime UpdatedAt { get; set; }

        
        public DateTime PublishedAt { get; set; }

        
        public object CustomExcerpt { get; set; }

        
        public object CodeinjectionHead { get; set; }

        
        public object CodeinjectionFoot { get; set; }

        
        public object CustomTemplate { get; set; }

        
        public object CanonicalUrl { get; set; }

        
        public bool SendEmailWhenPublished { get; set; }

        
        public List<Tag> Tags { get; set; }

        
        public List<Author> Authors { get; set; }

        
        public PrimaryAuthor PrimaryAuthor { get; set; }

        
        public PrimaryTag PrimaryTag { get; set; }

        
        public string Url { get; set; }

        
        public string Excerpt { get; set; }

        
        public int ReadingTime { get; set; }

        
        public object OgImage { get; set; }

        
        public object OgTitle { get; set; }

        
        public object OgDescription { get; set; }

        
        public object TwitterImage { get; set; }

        
        public object TwitterTitle { get; set; }

        
        public object TwitterDescription { get; set; }

        
        public object MetaTitle { get; set; }

        
        public object MetaDescription { get; set; }

        
        public object EmailSubject { get; set; }
    }


    public class Meta
    {
        public Pagination Pagination { get;set;}
    }
    public class Pagination
    {
        public int Page { get;set;}
        public int Limit { get;set;}
        public int Pages { get;set;}
        public int Total { get;set;}
        public int Next { get;set;}
        public int Prev { get;set;}
    }

    public class GhostPosts
    {
        public Meta Meta { get;set;}
        public List<Post> Posts { get; set; }
    }


}


