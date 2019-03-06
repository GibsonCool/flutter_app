import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ScrollableIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可滚动Widget简介"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              KuaiLePadding10Text("可滚动Widget都直接或间接包含一个Scrollable widget:"),
              Text("axisDirection：滚动方向。\n"),
              Text("physics：此属性接受一个ScrollPhysics对象，它决定可滚动Widget如何响应用户操作，"
                  "比如用户滑动完抬起手指后，继续执行动画；或者滑动到边界时，如何显示。默认情况下，"
                  "Flutter会根据具体平台分别使用不同的ScrollPhysics对象，应用不同的显示效果，如当滑动到边界时，"
                  "继续拖动的话，在iOS上会出现弹性效果，而在Android上会出现微光效果。如果你想在所有平台下使用同一种效果，"
                  "可以显式指定，Flutter SDK中包含了两个ScrollPhysics的子类可以直接使用："
                  "\n--> ClampingScrollPhysics：Android下微光效果。"
                  "\n--> BouncingScrollPhysics：iOS下弹性效果\n"),
              Text(
                  "controller：此属性接受一个ScrollController对象。ScrollController的主要作用是控制滚动位置和监听滚动事件。"
                  "默认情况下，widget树中会有一个默认的PrimaryScrollController，"
                  "如果子树中的可滚动widget没有显式的指定controller并且primary属性值为true时（默认就为true），"
                  "可滚动widget会使用这个默认的PrimaryScrollController，这种机制带来的好处是父widget可以控制子树中可滚动widget的滚动，"
                  "例如，Scaffold使用这种机制在iOS中实现了'回到顶部'的手势。我们将在本章后面“滚动控制”一节详细介绍ScrollController。"),
              KuaiLePadding10Text("Scrollbar:"),
              Text("Scrollbar是一个Material风格的滚动指示器（滚动条），如果要给可滚动widget添加滚动条，"
                  "只需将Scrollbar作为可滚动widget的父widget即可"),
            ],
          ),
        ),
      ),
    );
  }
}
