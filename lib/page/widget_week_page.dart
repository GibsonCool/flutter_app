import 'package:flutter/material.dart';

class WidgetWeekPage extends StatefulWidget {
  @override
  _WidgetWeekPageState createState() => _WidgetWeekPageState();
}

class _WidgetWeekPageState extends State<WidgetWeekPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widget of the Week'),),
      body: Center(child: Text('3'),),
    );
  }
}
