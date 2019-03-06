import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class SingleChildScrollViewTestPage extends StatelessWidget {
  final List<Widget> horizontalLetterView = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      .split("")
      .map((s) => Text(
            s,
            textScaleFactor: 2.5,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            KuaiLePadding10Text("SingleChildScrollView类似于Android中的ScrollView:"),
            Padding10Text("一个水平方向滚动的view(带有Scrollbar):"),
            Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, //设置滚动方向为水平
                child: Row(
                  children: horizontalLetterView,
                ),
              ),
            ),
            Padding10Text("reverse:API文档解释是：是否按照阅读方向相反的方向滑动。是否颠倒'头'和'尾'的位置(带有Ios中Scrollbar风格的滚动条)"),
            CupertinoScrollbar(
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal, //设置滚动方向为水平
                child: Row(
                  children: horizontalLetterView,
                ),
              ),
            ),
            Padding10Text(
                "primary：指是否使用widget树中默认的PrimaryScrollController；当滑动方向为垂直方向"
                "（scrollDirection值为Axis.vertical）并且controller没有指定时，primary默认为true."),
          ],
        ),
      ),
    );
  }
}

