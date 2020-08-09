import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:servicestack/client.dart';
import 'package:google_fonts/google_fonts.dart';

import 'blog_client.dtos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<QueryResponse<Post>> apiResponse = Completer<QueryResponse<Post>>();
  JsonServiceClient client = JsonServiceClient("http://10.0.2.2:5001/");
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    client.get(PostQueryRequest()).then((val) {
      apiResponse.complete(val);
    }).catchError((err) {
      debugPrint(err);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<QueryResponse<Post>>(
              future: apiResponse.future,
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
                        child: ListTile(
                            title: Text(snapshot.data.results[index].title)),
                      );
                    });
              })),
    );
  }
}

class PostDetails extends StatefulWidget {
  String _postId;

  PostDetails(this._postId);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  JsonServiceClient client = JsonServiceClient("http://10.0.2.2:5001/");
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
                future: client.get(PostRequest(id: widget._postId)),
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
