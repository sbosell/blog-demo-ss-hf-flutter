import 'dart:async';

import 'package:blog_app_flutter/api/blog_client.dtos.dart';
import 'package:servicestack/client.dart';

class BlogApi {
  String _apiUrl;
  JsonServiceClient client;

  BlogApi(this._apiUrl) {
    client = JsonServiceClient(this._apiUrl);
  }

  // TODO: add paging support
  Future<QueryResponse<Post>> getPosts() async {
    return client.get(PostQueryRequest());
  }

  Future<Post> getPost(String postId) async {
    return client.get(PostRequest(id: postId));
  }
}
