import 'package:blog_app_flutter/api/blog_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicestack/client.dart';

import '../api/blog_client.dtos.dart';

class PostDetails extends StatefulWidget {
  String _postId;

  PostDetails(this._postId);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final GetIt getIt = GetIt.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: FutureBuilder<Post>(
                future: getIt<BlogApi>().getPost(widget._postId),
                builder: (context, AsyncSnapshot<Post> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  var post = snapshot.data;
                  return ListView(children: [
                    Image.network(post.featureImage, fit: BoxFit.cover),
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Html(data: post.html, style: {
                      "code": Style(
                          backgroundColor: Colors.grey[200],
                          fontFamily:
                              GoogleFonts.getFont('Ubuntu Mono').fontFamily),
                      "pre": Style(
                          backgroundColor: Colors.grey[200],
                          fontFamily:
                              GoogleFonts.getFont('Ubuntu Mono').fontFamily),
                      "figure": Style(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(0),
                      ),
                    })
                  ]);
                })));
  }
}
