import 'dart:async';

import 'package:blog_app_flutter/api/blog_api.dart';
import 'package:blog_app_flutter/screens/post_details.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:servicestack/client.dart';
import 'package:servicestack/servicestack.dart';

import '../api/blog_client.dtos.dart';

class BlogListing extends StatefulWidget {
  BlogListing({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BlogListingState createState() => _BlogListingState();
}

class _BlogListingState extends State<BlogListing> {
  final GetIt getIt = GetIt.instance;

  // Completer<QueryResponse<Post>> apiResponse = Completer<QueryResponse<Post>>();
  // JsonServiceClient client = JsonServiceClient("http://10.0.2.2:5001/");
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // client.get(PostQueryRequest()).then((val) {
    //   apiResponse.complete(val);
    // }).catchError((err) {
    //   debugPrint(err);
    // });
    super.didChangeDependencies();
  }

  List<Widget> PostRow(Post post, int index) {
    var image = Expanded(
        flex: 1, child: Image.network(post.featureImage, fit: BoxFit.contain));
    List<Widget> dataList = [];
    dataList.add(Text(post.title));
    dataList.addAll(post.tags
        .map((e) => Chip(
              backgroundColor: Theme.of(context).accentColor,
              label: Text(e.name),
            ))
        .toList());

    var data = Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: dataList,
            ),
          ),
        ));
    if (index % 2 == 0) return [image, data];

    return [data, image];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<QueryResponse<Post>>(
              future: getIt<BlogApi>().getPosts(),
              builder: (context, AsyncSnapshot<QueryResponse<Post>> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView.builder(
                    itemCount: snapshot.data.results.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostDetails(
                                    snapshot.data.results[index].id)),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: PostRow(
                                      snapshot.data.results[index], index)),
                            ),
                          ),
                        ),
                      );
                    });
              })),
    );
  }
}
