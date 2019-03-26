import 'package:flutter/material.dart';

class WeekSliverAppBarWidget extends StatefulWidget {
  @override
  _WeekSliverAppBarWidgetState createState() => _WeekSliverAppBarWidgetState();
}

class _WeekSliverAppBarWidgetState extends State<WeekSliverAppBarWidget> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          floating: true,
          pinned: true,
          snap: true,
//          title: Text("SliverAppBar"),
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("SliverAppBar"),
            background: Image.network(
              'https://www.patiliyo.com/wp-content/uploads/2016/10/kasli-kedi-patiliyo-8.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            height: 100,
            color: Colors.deepOrangeAccent,
            child: Text(
              "SliverAppBar可以用来定制炫酷的顶部。\n"
                  "floating: 控制下滑时是否先悬浮展示flexibleSpace\n"
                  "painned: 控制titleBar是否固定在头部\n"
                  "expandedHeight 和 flexibleSpace 通常一起使用以达到不同高度显示不同样式的效果",
              style: TextStyle(fontSize: 12,color: Colors.white,decorationStyle:TextDecorationStyle.wavy),
            ),
          ),
          Container(
            height: 200,
            color: Colors.blue,
          ),
          Container(
            height: 300,
            color: Colors.greenAccent,
          ),
          Container(
            height: 400,
            color: Colors.deepPurpleAccent,
          ),
          Container(
            height: 500,
            color: Colors.yellow,
          ),
        ])),
      ],
    );
  }
}
