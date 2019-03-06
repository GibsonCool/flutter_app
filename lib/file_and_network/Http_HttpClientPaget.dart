
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Http_HttpClientPage extends StatelessWidget {
  String _url = "https://book.flutterchina.club/chapter10/http.html";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter WebView Demo",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      routes: {
        "/": (_) => WebviewScaffold(
          url: _url,
          appBar: AppBar(
            title: Text("Http请求-HttpClient"),
          ),
        )
      },
    );
  }
}
