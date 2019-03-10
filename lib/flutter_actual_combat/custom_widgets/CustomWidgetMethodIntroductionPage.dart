import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class CustomWidgetMethodIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义Widget方法简介"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("1、组合其它Widget"),
        Padding10Text(
            "这种方式是通过拼装其它低级别的Widget来组合成一个高级别的Widget，例如我们之前介绍的Container就是一个组合Widget，它是由DecoratedBox、ConstrainedBox、Transform、Padding、Align等组成"
            "在Flutter中，组合的思想非常重要，Flutter提供了非常多的基础Widget，而我们的界面开发都是按照需要组合这些Widget来实现各种不同的布局。"),
        KuaiLePadding10Text("2、自绘"),
        Padding10Text("如果遇到无法通过系统提供的现有Widget实现的UI时，如我们需要一个渐变圆形进度条，而Flutter提供的CircularProgressIndicator并不支持在显示精确进度时对进度条应用渐变色（其valueColor 属性只支持执行旋转动画时变化Indicator的颜色），这时最好的方法就是通过自定义Widget绘制逻辑来画出我们期望的外观。Flutter中提供了CustomPaint和Canvas供我们自绘UI外观。"),
        KuaiLePadding10Text("3、实现RenderObject"),
        Padding10Text(""),
      ]),
    );
  }
}
