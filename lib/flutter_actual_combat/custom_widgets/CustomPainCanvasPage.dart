import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class CustomPainCanvasPage extends StatefulWidget {
  @override
  _CustomPainCanvasPageState createState() => _CustomPainCanvasPageState();
}

class _CustomPainCanvasPageState extends State<CustomPainCanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPain与Canvas"),
      ),
      body: ScrollBarColumBody(<Widget>[
        Padding10Text(
          "几乎所有的UI系统都会提供一个自绘UI的接口，这个接口通常会提供一块2D画布Canvas，Canvas内部封装了一些基本绘制的API，开发者可以通过Canvas绘制各种自定义图形。在Flutter中，提供了一个CustomPaint Widget，它可以结合一个画笔CustomPainter来实现绘制自定义图形。",
          mycolor: Colors.blue[300],
        ),
        KuaiLePadding10Text("CustomPaint:"),
        Padding10Text("CustomPain构造函数参数：\n"
            "-->painter: 背景画笔，会显示在子节点后面;\n\n"
            "-->foregroundPainter: 前景画笔，会显示在子节点前面\n\n"
            "-->size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现。\n\n"
            "-->isComplex：是否复杂的绘制，如果是，Flutter会应用一些缓存策略来减少重复渲染的开销。\n"
            "-->willChange：和isComplex配合使用，当启用缓存时，该属性代表在下一帧中绘制是否会改变。\n"),
        Padding10Text(
            "可以看到，绘制时我们需要提供前景或背景画笔，两者也可以同时提供。我们的画笔需要继承CustomPainter类，我们在画笔类中实现真正的绘制逻辑。",
            mycolor: Colors.blue[300]),
        KuaiLePadding10Text("注意："),
        Padding10Text(
          "如果CustomPaint有子节点，为了避免子节点不必要的重绘并提高性能，通常情况下都会将子节点包裹在RepaintBoundary Widget中，这样会在绘制时创建一个新的绘制层（Layer），其子Widget将在新的Layer上绘制，而父Widget将在原来Layer上绘制，也就是说RepaintBoundary 子Widget的绘制将独立于父Widget的绘制，RepaintBoundary会隔离其子节点和CustomPaint本身的绘制边界。",
          mycolor: Colors.redAccent[100],
        ),
        KuaiLePadding10Text("CustomPainter:"),
        Padding10Text("CustomPainter 是一个抽象类，定义了两个抽象函数，\n"
            "用于实现绘制逻辑的抽象方法paint:\n"
            "      void  paint(Canvas canvas , Size size);\n"
            "用于判断是否需要重绘的抽象方法shouldRepaint:\n"
            "      bool shouldRepaint(CustomPainter oldDelegate);"),
        Padding10Text("paint 有两个参数：\n"
            "      Canvas:一个画布，包括各种绘制方法，常用的比如：drawLine/drawPoint/drawPath/drawImage/drawRect/drawCircle/drawOval/drawArc\n"
            "      Size:当前绘制区域大小"),
        KuaiLePadding10Text("画笔Paint："),
        Padding10Text("现在画布有了，我们最后还缺一个画笔，Flutter提供了Paint类来实现画笔。在Paint中，我们可以配置画笔的各种属性如粗细、颜色、样式等\n\n"
            "  var paint = Paint() //创建一个画笔并配置其属性\n"
            "     ..isAntiAlias = true //是否开启抗锯齿\n"
            "     ..style = PaintingStyle.fill //画笔样式：填充\n"
            "     ..color = Colors.red; //画笔颜色\n"),
        Center(
          child: CustomPaint(
            size: Size(300, 300),
            painter: Mypainter(),
          ),
        ),
      ]),
    );
  }
}

///绘制五子棋盘
class Mypainter extends CustomPainter {
  final int num = 15;

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / num;
    double eHeight = size.height / num;
    //设置画笔样式
    var paint = Paint()
      ..isAntiAlias = true //开启抗锯齿
      ..style = PaintingStyle.fill //画笔样式填充
      ..color = Colors.yellow[200];
    //画棋盘背景
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black45
      ..strokeWidth = 1.0;
    //横向的网格线
    for (int i = 0; i <= num; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
    //纵向的网格线
    for (int i = 0; i <= num; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑色的棋子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  //实际场景中正确利用此回调可以避免重绘开销，这里直接返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
