import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekAnimatedContainerWidgetPage extends StatefulWidget {
  @override
  _WeekAnimatedContainerWidgetPageState createState() =>
      _WeekAnimatedContainerWidgetPageState();
}

class _WeekAnimatedContainerWidgetPageState
    extends State<WeekAnimatedContainerWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: ScrollBarColumBody([
        Text('test'),
//        AnimatedContainer(),
      ]),
    );
  }
}
