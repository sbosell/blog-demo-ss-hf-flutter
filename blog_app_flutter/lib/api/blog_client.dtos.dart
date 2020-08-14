/* Options:
Date: 2020-08-08 15:31:23
Version: 5.93
Tip: To override a DTO option, remove "//" prefix before updating
BaseUrl: https://localhost:44300

//GlobalNamespace: 
//AddServiceStackTypes: True
//AddResponseStatus: False
//AddImplicitVersion: 
//AddDescriptionAsComments: True
//IncludeTypes: 
//ExcludeTypes: 
//DefaultImports: package:servicestack/servicestack.dart
*/

import 'package:servicestack/servicestack.dart';

class GhostPagedRequest implements IConvertible
{
    int page;
    int limit;

    GhostPagedRequest({this.page,this.limit});
    GhostPagedRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        page = json['page'];
        limit = json['limit'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'page': page,
        'limit': limit
    };

    TypeContext context = _ctx;
}

class Pagination implements IConvertible
{
    int page;
    int limit;
    int pages;
    int total;
    int next;
    int prev;

    Pagination({this.page,this.limit,this.pages,this.total,this.next,this.prev});
    Pagination.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        page = json['page'];
        limit = json['limit'];
        pages = json['pages'];
        total = json['total'];
        next = json['next'];
        prev = json['prev'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'page': page,
        'limit': limit,
        'pages': pages,
        'total': total,
        'next': next,
        'prev': prev
    };

    TypeContext context = _ctx;
}

class Meta implements IConvertible
{
    Pagination pagination;

    Meta({this.pagination});
    Meta.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        pagination = JsonConverters.fromJson(json['pagination'],'Pagination',context);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'pagination': JsonConverters.toJson(pagination,'Pagination',context)
    };

    TypeContext context = _ctx;
}

class Tag implements IConvertible
{
    String id;
    String name;
    String slug;
    dynamic description;
    dynamic featureImage;
    String visibility;
    dynamic metaTitle;
    dynamic metaDescription;
    String url;

    Tag({this.id,this.name,this.slug,this.description,this.featureImage,this.visibility,this.metaTitle,this.metaDescription,this.url});
    Tag.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        slug = json['slug'];
        description = JsonConverters.fromJson(json['description'],'dynamic',context);
        featureImage = JsonConverters.fromJson(json['featureImage'],'dynamic',context);
        visibility = json['visibility'];
        metaTitle = JsonConverters.fromJson(json['metaTitle'],'dynamic',context);
        metaDescription = JsonConverters.fromJson(json['metaDescription'],'dynamic',context);
        url = json['url'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'description': JsonConverters.toJson(description,'dynamic',context),
        'featureImage': JsonConverters.toJson(featureImage,'dynamic',context),
        'visibility': visibility,
        'metaTitle': JsonConverters.toJson(metaTitle,'dynamic',context),
        'metaDescription': JsonConverters.toJson(metaDescription,'dynamic',context),
        'url': url
    };

    TypeContext context = _ctx;
}

class Author implements IConvertible
{
    String id;
    String name;
    String slug;
    String profileImage;
    dynamic coverImage;
    dynamic bio;
    String website;
    String location;
    String facebook;
    String twitter;
    dynamic metaTitle;
    dynamic metaDescription;
    String url;

    Author({this.id,this.name,this.slug,this.profileImage,this.coverImage,this.bio,this.website,this.location,this.facebook,this.twitter,this.metaTitle,this.metaDescription,this.url});
    Author.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        slug = json['slug'];
        profileImage = json['profileImage'];
        coverImage = JsonConverters.fromJson(json['coverImage'],'dynamic',context);
        bio = JsonConverters.fromJson(json['bio'],'dynamic',context);
        website = json['website'];
        location = json['location'];
        facebook = json['facebook'];
        twitter = json['twitter'];
        metaTitle = JsonConverters.fromJson(json['metaTitle'],'dynamic',context);
        metaDescription = JsonConverters.fromJson(json['metaDescription'],'dynamic',context);
        url = json['url'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'profileImage': profileImage,
        'coverImage': JsonConverters.toJson(coverImage,'dynamic',context),
        'bio': JsonConverters.toJson(bio,'dynamic',context),
        'website': website,
        'location': location,
        'facebook': facebook,
        'twitter': twitter,
        'metaTitle': JsonConverters.toJson(metaTitle,'dynamic',context),
        'metaDescription': JsonConverters.toJson(metaDescription,'dynamic',context),
        'url': url
    };

    TypeContext context = _ctx;
}

class PrimaryAuthor implements IConvertible
{
    String id;
    String name;
    String slug;
    String profileImage;
    dynamic coverImage;
    dynamic bio;
    String website;
    String location;
    String facebook;
    String twitter;
    dynamic metaTitle;
    dynamic metaDescription;
    String url;

    PrimaryAuthor({this.id,this.name,this.slug,this.profileImage,this.coverImage,this.bio,this.website,this.location,this.facebook,this.twitter,this.metaTitle,this.metaDescription,this.url});
    PrimaryAuthor.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        slug = json['slug'];
        profileImage = json['profileImage'];
        coverImage = JsonConverters.fromJson(json['coverImage'],'dynamic',context);
        bio = JsonConverters.fromJson(json['bio'],'dynamic',context);
        website = json['website'];
        location = json['location'];
        facebook = json['facebook'];
        twitter = json['twitter'];
        metaTitle = JsonConverters.fromJson(json['metaTitle'],'dynamic',context);
        metaDescription = JsonConverters.fromJson(json['metaDescription'],'dynamic',context);
        url = json['url'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'profileImage': profileImage,
        'coverImage': JsonConverters.toJson(coverImage,'dynamic',context),
        'bio': JsonConverters.toJson(bio,'dynamic',context),
        'website': website,
        'location': location,
        'facebook': facebook,
        'twitter': twitter,
        'metaTitle': JsonConverters.toJson(metaTitle,'dynamic',context),
        'metaDescription': JsonConverters.toJson(metaDescription,'dynamic',context),
        'url': url
    };

    TypeContext context = _ctx;
}

class PrimaryTag implements IConvertible
{
    String id;
    String name;
    String slug;
    dynamic description;
    dynamic featureImage;
    String visibility;
    dynamic metaTitle;
    dynamic metaDescription;
    String url;

    PrimaryTag({this.id,this.name,this.slug,this.description,this.featureImage,this.visibility,this.metaTitle,this.metaDescription,this.url});
    PrimaryTag.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        slug = json['slug'];
        description = JsonConverters.fromJson(json['description'],'dynamic',context);
        featureImage = JsonConverters.fromJson(json['featureImage'],'dynamic',context);
        visibility = json['visibility'];
        metaTitle = JsonConverters.fromJson(json['metaTitle'],'dynamic',context);
        metaDescription = JsonConverters.fromJson(json['metaDescription'],'dynamic',context);
        url = json['url'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'description': JsonConverters.toJson(description,'dynamic',context),
        'featureImage': JsonConverters.toJson(featureImage,'dynamic',context),
        'visibility': visibility,
        'metaTitle': JsonConverters.toJson(metaTitle,'dynamic',context),
        'metaDescription': JsonConverters.toJson(metaDescription,'dynamic',context),
        'url': url
    };

    TypeContext context = _ctx;
}

class Post implements IConvertible
{
    String slug;
    String id;
    String uuid;
    String title;
    String html;
    String commentId;
    String featureImage;
    bool featured;
    String visibility;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    dynamic customExcerpt;
    dynamic codeinjectionHead;
    dynamic codeinjectionFoot;
    dynamic customTemplate;
    dynamic canonicalUrl;
    bool sendEmailWhenPublished;
    List<Tag> tags;
    List<Author> authors;
    PrimaryAuthor primaryAuthor;
    PrimaryTag primaryTag;
    String url;
    String excerpt;
    int readingTime;
    dynamic ogImage;
    dynamic ogTitle;
    dynamic ogDescription;
    dynamic twitterImage;
    dynamic twitterTitle;
    dynamic twitterDescription;
    dynamic metaTitle;
    dynamic metaDescription;
    dynamic emailSubject;

    Post({this.slug,this.id,this.uuid,this.title,this.html,this.commentId,this.featureImage,this.featured,this.visibility,this.createdAt,this.updatedAt,this.publishedAt,this.customExcerpt,this.codeinjectionHead,this.codeinjectionFoot,this.customTemplate,this.canonicalUrl,this.sendEmailWhenPublished,this.tags,this.authors,this.primaryAuthor,this.primaryTag,this.url,this.excerpt,this.readingTime,this.ogImage,this.ogTitle,this.ogDescription,this.twitterImage,this.twitterTitle,this.twitterDescription,this.metaTitle,this.metaDescription,this.emailSubject});
    Post.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        slug = json['slug'];
        id = json['id'];
        uuid = json['uuid'];
        title = json['title'];
        html = json['html'];
        commentId = json['commentId'];
        featureImage = json['featureImage'];
        featured = json['featured'];
        visibility = json['visibility'];
        createdAt = JsonConverters.fromJson(json['createdAt'],'DateTime',context);
        updatedAt = JsonConverters.fromJson(json['updatedAt'],'DateTime',context);
        publishedAt = JsonConverters.fromJson(json['publishedAt'],'DateTime',context);
        customExcerpt = JsonConverters.fromJson(json['customExcerpt'],'dynamic',context);
        codeinjectionHead = JsonConverters.fromJson(json['codeinjectionHead'],'dynamic',context);
        codeinjectionFoot = JsonConverters.fromJson(json['codeinjectionFoot'],'dynamic',context);
        customTemplate = JsonConverters.fromJson(json['customTemplate'],'dynamic',context);
        canonicalUrl = JsonConverters.fromJson(json['canonicalUrl'],'dynamic',context);
        sendEmailWhenPublished = json['sendEmailWhenPublished'];
        tags = JsonConverters.fromJson(json['tags'],'List<Tag>',context);
        authors = JsonConverters.fromJson(json['authors'],'List<Author>',context);
        primaryAuthor = JsonConverters.fromJson(json['primaryAuthor'],'PrimaryAuthor',context);
        primaryTag = JsonConverters.fromJson(json['primaryTag'],'PrimaryTag',context);
        url = json['url'];
        excerpt = json['excerpt'];
        readingTime = json['readingTime'];
        ogImage = JsonConverters.fromJson(json['ogImage'],'dynamic',context);
        ogTitle = JsonConverters.fromJson(json['ogTitle'],'dynamic',context);
        ogDescription = JsonConverters.fromJson(json['ogDescription'],'dynamic',context);
        twitterImage = JsonConverters.fromJson(json['twitterImage'],'dynamic',context);
        twitterTitle = JsonConverters.fromJson(json['twitterTitle'],'dynamic',context);
        twitterDescription = JsonConverters.fromJson(json['twitterDescription'],'dynamic',context);
        metaTitle = JsonConverters.fromJson(json['metaTitle'],'dynamic',context);
        metaDescription = JsonConverters.fromJson(json['metaDescription'],'dynamic',context);
        emailSubject = JsonConverters.fromJson(json['emailSubject'],'dynamic',context);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'slug': slug,
        'id': id,
        'uuid': uuid,
        'title': title,
        'html': html,
        'commentId': commentId,
        'featureImage': featureImage,
        'featured': featured,
        'visibility': visibility,
        'createdAt': JsonConverters.toJson(createdAt,'DateTime',context),
        'updatedAt': JsonConverters.toJson(updatedAt,'DateTime',context),
        'publishedAt': JsonConverters.toJson(publishedAt,'DateTime',context),
        'customExcerpt': JsonConverters.toJson(customExcerpt,'dynamic',context),
        'codeinjectionHead': JsonConverters.toJson(codeinjectionHead,'dynamic',context),
        'codeinjectionFoot': JsonConverters.toJson(codeinjectionFoot,'dynamic',context),
        'customTemplate': JsonConverters.toJson(customTemplate,'dynamic',context),
        'canonicalUrl': JsonConverters.toJson(canonicalUrl,'dynamic',context),
        'sendEmailWhenPublished': sendEmailWhenPublished,
        'tags': JsonConverters.toJson(tags,'List<Tag>',context),
        'authors': JsonConverters.toJson(authors,'List<Author>',context),
        'primaryAuthor': JsonConverters.toJson(primaryAuthor,'PrimaryAuthor',context),
        'primaryTag': JsonConverters.toJson(primaryTag,'PrimaryTag',context),
        'url': url,
        'excerpt': excerpt,
        'readingTime': readingTime,
        'ogImage': JsonConverters.toJson(ogImage,'dynamic',context),
        'ogTitle': JsonConverters.toJson(ogTitle,'dynamic',context),
        'ogDescription': JsonConverters.toJson(ogDescription,'dynamic',context),
        'twitterImage': JsonConverters.toJson(twitterImage,'dynamic',context),
        'twitterTitle': JsonConverters.toJson(twitterTitle,'dynamic',context),
        'twitterDescription': JsonConverters.toJson(twitterDescription,'dynamic',context),
        'metaTitle': JsonConverters.toJson(metaTitle,'dynamic',context),
        'metaDescription': JsonConverters.toJson(metaDescription,'dynamic',context),
        'emailSubject': JsonConverters.toJson(emailSubject,'dynamic',context)
    };

    TypeContext context = _ctx;
}

class GhostPosts implements IConvertible
{
    Meta meta;
    List<Post> posts;

    GhostPosts({this.meta,this.posts});
    GhostPosts.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        meta = JsonConverters.fromJson(json['meta'],'Meta',context);
        posts = JsonConverters.fromJson(json['posts'],'List<Post>',context);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'meta': JsonConverters.toJson(meta,'Meta',context),
        'posts': JsonConverters.toJson(posts,'List<Post>',context)
    };

    TypeContext context = _ctx;
}

// @Route("/external/ghost/posts")
class GhostPostsProxyRequest extends GhostPagedRequest implements IReturn<GhostPosts>, IConvertible
{
    GhostPostsProxyRequest();
    GhostPostsProxyRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() { return new GhostPosts(); }
    String getTypeName() { return "GhostPostsProxyRequest"; }
    TypeContext context = _ctx;
}

// @Route("/api/posts")
class PostQueryRequest extends QueryData<Post> implements IReturn<QueryResponse<Post>>, IConvertible
{
    String filter;

    PostQueryRequest({this.filter});
    PostQueryRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filter = json['filter'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filter': filter
    });

    createResponse() { return new QueryResponse<Post>(); }
    String getTypeName() { return "PostQueryRequest"; }
    TypeContext context = _ctx;
}

// @Route("/api/posts/{id}")
class PostRequest implements IReturn<Post>, IConvertible
{
    String id;

    PostRequest({this.id});
    PostRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id
    };

    createResponse() { return new Post(); }
    String getTypeName() { return "PostRequest"; }
    TypeContext context = _ctx;
}

TypeContext _ctx = new TypeContext(library: 'localhost', types: <String, TypeInfo> {
    'GhostPagedRequest': new TypeInfo(TypeOf.Class, create:() => new GhostPagedRequest()),
    'Pagination': new TypeInfo(TypeOf.Class, create:() => new Pagination()),
    'Meta': new TypeInfo(TypeOf.Class, create:() => new Meta()),
    'Tag': new TypeInfo(TypeOf.Class, create:() => new Tag()),
    'Author': new TypeInfo(TypeOf.Class, create:() => new Author()),
    'PrimaryAuthor': new TypeInfo(TypeOf.Class, create:() => new PrimaryAuthor()),
    'PrimaryTag': new TypeInfo(TypeOf.Class, create:() => new PrimaryTag()),
    'Post': new TypeInfo(TypeOf.Class, create:() => new Post()),
    'List<Tag>': new TypeInfo(TypeOf.Class, create:() => new List<Tag>()),
    'List<Author>': new TypeInfo(TypeOf.Class, create:() => new List<Author>()),
    'GhostPosts': new TypeInfo(TypeOf.Class, create:() => new GhostPosts()),
    'List<Post>': new TypeInfo(TypeOf.Class, create:() => new List<Post>()),
    'GhostPostsProxyRequest': new TypeInfo(TypeOf.Class, create:() => new GhostPostsProxyRequest()),
    'PostQueryRequest': new TypeInfo(TypeOf.Class, create:() => new PostQueryRequest()),
    'PostRequest': new TypeInfo(TypeOf.Class, create:() => new PostRequest()),
});

