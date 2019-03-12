import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekExpandedWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded widget"),
      ),
      body: ScrollBarColumBody(
        <Widget>[
          Text("Expanded:通过Expanded Widget 可以将 child Widget 大小设置为填充满适合的行或列中，通过flex属性可以设置多个Expanded存在时候的所占百分比"),
          Row(
            children: <Widget>[
              colorWidget(Colors.red),
              colorWidget(Colors.blue),
              colorWidget(Colors.deepPurple),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              colorWidget(Colors.red),
              Expanded(
                child: colorWidget(Colors.blue),
              ),
              colorWidget(Colors.deepPurple),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              colorWidget(Colors.red),
              Expanded(
                child: colorWidget(Colors.blue),
              ),
              colorWidget(Colors.deepPurple),
              Expanded(
                child: colorWidget(Colors.blue),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              colorWidget(Colors.red),
              Expanded(
                flex: 3,
                child: colorWidget(Colors.blue),
              ),
              colorWidget(Colors.deepPurple),
              Expanded(
                child: colorWidget(Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget colorWidget(Color color) {
    return Container(
      width: 50,
      height: 50,
      color: color,
      child: Text(''),
    );
  }
}
