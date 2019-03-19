import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekPageViewWidget extends StatefulWidget {
  @override
  _WeekPageViewWidgetState createState() => _WeekPageViewWidgetState();
}

class _WeekPageViewWidgetState extends State<WeekPageViewWidget> {
  PageController _controller;

  List<Widget> listView = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.pinkAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.redAccent,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
      ),
      body: Column(
        children: <Widget>[
          Text(
              'ViewPage 可以通过initPage 设置初始显示页面，以及viewportFraction设置每页page占据窗口多少比例'),
          Height200SizeBox(
            childWidget: PageView(
              controller: _controller,
              children: listView,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Height200SizeBox(
            childWidget: PageView(
              scrollDirection: Axis.vertical,
              controller: _controller,
              children: listView,
            ),
          ),
        ],
      ),
    );
  }
}
