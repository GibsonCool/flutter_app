import 'package:flutter/material.dart';

class InFocusPage extends StatefulWidget {
  @override
  _InFocusPageState createState() => _InFocusPageState();
}

class _InFocusPageState extends State<InFocusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter in Focus'),),
      body: Center(child: Text('2'),),
    );
  }
}
