import 'dart:async';

import 'package:blog_app_flutter/api/blog_api.dart';
import 'package:blog_app_flutter/screens/blog_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get_it/get_it.dart';
import 'package:servicestack/client.dart';
import 'package:google_fonts/google_fonts.dart';

import 'api/blog_client.dtos.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<BlogApi>(BlogApi("http://10.0.2.2:5001/"));
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
      home: BlogListing(title: 'Ambient Data Listing  '),
    );
  }
}
