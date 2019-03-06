import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AnimationIntroductionPage extends StatefulWidget {
  @override
  _AnimationIntroductionPageState createState() =>
      _AnimationIntroductionPageState();
}

class _AnimationIntroductionPageState extends State<AnimationIntroductionPage> {
  String _url = "https://book.flutterchina.club/chapter9/intro.html";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      routes: {
        "/": (_) => WebviewScaffold(
              url: _url,
              appBar: AppBar(
                title: Text("Flutter动画简介"),
              ),
            )
      },
    );
  }
}
