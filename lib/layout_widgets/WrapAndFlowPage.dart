import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WrapAndFlowPage extends StatelessWidget {
  final nameChips = [
    NameChip("刘", "德华"),
    NameChip("谢", "霆锋"),
    NameChip("李", "建"),
    NameChip("张", "学友"),
    NameChip("胡", "歌"),
    NameChip("彭", "于宴"),
  ];

  final colorContainers = [
    ColorContainer(Colors.red),
    ColorContainer(Colors.green),
    ColorContainer(Colors.blue),
    ColorContainer(Colors.yellow),
    ColorContainer(Colors.brown),
    ColorContainer(Colors.purple),
    ColorContainer(Colors.deepOrange, 90),
    ColorContainer(Colors.deepOrange, 70),
    ColorContainer(Colors.deepOrange, 30),
    ColorContainer(Colors.deepOrange),
    ColorContainer(Colors.deepOrange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("流式布局Wrap、Flow"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              KuaiLePadding10Text("在介绍Row和Colum时，如果子widget超出屏幕范围，则会报溢出错误"),
              Row(
                children: <Widget>[Text("test" * 100)],
              ),
              KuaiLePadding10Text("将上例中的 Row 换成 wrap溢出部分会自动这行"),
              Wrap(
                children: <Widget>[Text("test" * 100)],
              ),
              KuaiLePadding10Text("通过Wrap特有的几个属性改变样式:",textScaleFactor: 1.5,),
              Text(
                "spacing：主轴方向子widget的间距\n"
                    "runSpacing：纵轴方向的间距\n"
                    "runAlignment：纵轴方向的对齐方式",
                style: TextStyle(color: Colors.red),
              ),
              KuaiLePadding10Text("Wrap默认样式："),
              Wrap(
                children: nameChips,
              ),
              KuaiLePadding10Text("Wrap加间距、排列方式："),
              Wrap(
                spacing: 20, //主轴（Wrap的是水平）方向间距
                runSpacing: -10, //纵轴（垂直）方向间距
                alignment: WrapAlignment.center,
                children: nameChips,
              ),
              KuaiLeText("Flow示例:"),
              Text(
                "一般优先考虑使用Wrap，因为Flow过于复杂，主要用于一些需要自定义布局策略或性能要求较高（如动画）的场景中。\n"
                    "1、设置大小：不自适应子widget大小，必须通过制定父容器大小，或者实现FlowDelegate中的getSize固定大小。\n"
                    "2、是否重绘：shouldRepaint中判断是否不是同一个对象。\n"
                    "3、计算位置并绘制子widget：paintChildren方法中进行自己的布局策略计算。",
                style: TextStyle(color: Colors.red),
              ),
              Flow(
                delegate: TestFlowDelegate(EdgeInsets.all(10)),
                children: colorContainers,
              ),
            ],
          ),
        ));
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate(this.margin);

  ///通过自己计算出每个子widget的位置，并且乔勇context.paintChild进行重绘
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    var maxHeight = margin.top + margin.bottom;

    ///计算每个子widget的位置并重绘
    print("size.width:${context.size.width}");
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      //用于标记最大高度
      maxHeight = maxHeight < context.getChildSize(i).height
          ? context.getChildSize(i).height
          : maxHeight;
      if (w < context.size.width) {
        //如果小于容器宽度，则直接绘制子widget的 x,y 位置
        print("x:$x  y:$y");
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        print(
            "xx:$x  yy:$y  maxHeight:$maxHeight  childHight:${context.getChildSize(i).height}");
        //如果大于容器宽度,重置x为初始位置，进行y高度行数计算
        x = margin.left;

        y += maxHeight + margin.top + margin.bottom;
        //
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  ///不自适应子widget大小，必须通过此方法返回固定大小。
  @override
  Size getSize(BoxConstraints constraints) {
    //设置宽带填满，高度固定400大小
    return Size(double.infinity, 400);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class ColorContainer extends Container {
  final Color defaultColor;

  ColorContainer(this.defaultColor, [double defaultSize = 50.0])
      : super(
          width: defaultSize,
          height: defaultSize,
          color: defaultColor,
        );
}

class NameChip extends Chip {
  final String familyName;
  final String givenName;

  NameChip(this.familyName, this.givenName)
      : super(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              familyName,
              textScaleFactor: 0.8,
            ),
          ),
          label: Text(givenName),
        );
}
