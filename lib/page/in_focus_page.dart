import 'package:flutter/material.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_app/main.dart';

class InFocusPage extends StatefulWidget {
  @override
  _InFocusPageState createState() => _InFocusPageState();
}

class _InFocusPageState extends State<InFocusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter in Focus'),),
      body: ScrollBarColumBody(
        <Widget>[
          MyListTile(Colors.redAccent, 0, "Building your first flutteer Widget", Routes.focusFirstFlutterPage, context),
          MyListTile(Colors.redAccent, 1, "Using Material Design with Flutter", Routes.focusUsingMDPage, context),
        ]
      ),
    );
  }
}
