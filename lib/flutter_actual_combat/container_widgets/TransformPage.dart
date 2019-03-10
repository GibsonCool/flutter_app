import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'dart:math' as math;

class TransformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("变换Transform"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 90, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.black54,
                child: Transform(
                  alignment: Alignment.topRight, //相对于坐标系原点的对齐方式(这里的是右上角)
                  transform: Matrix4.skewY(0.3),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.deepOrange,
                    child: const Text("以右上角为对齐方式，Y轴倾斜0.3弧度"),
                  ),
                ),
              ),
              KuaiLePadding10Text("平移:"),
              Row(
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text("平移示例"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Transform.translate(
                      //默认原点为左上角，X向左为右，Y向下为正
                      offset: Offset(20, 10),
                      child: Text("平移示例"),
                    ),
                  ),
                ],
              ),
              KuaiLePadding10Text("旋转:"),
              Row(
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text("旋转示例"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Transform.rotate(
                      //旋转90度 TODO：这里的计算规则是什么没搞懂？
                      angle: math.pi / 2,
                      child: Text("旋转示例"),
                    ),
                  ),
                ],
              ),
              KuaiLePadding10Text("缩放:"),
              Row(
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text("缩放示例"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Transform.scale(
                      scale: 1.3,
                      child: Text("缩放示例"),
                    ),
                  ),
                ],
              ),
              KuaiLePadding10Text("注意:"),
              Text("Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，"
                  "所以无论对子widget应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Text("绘制不影响布局"),
                    ),
                  ),
                  Text(
                    "对比文字",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ],
              ),
              Text("解释：由于第一个Text应用变换(放大)后，其在绘制时会放大，但其占用的空间依然为红色部分，"
                  "所以第二个text会紧挨着红色部分，最终就会出现文字有重合部分"),
              KuaiLePadding10Text("RotatedBox:"),
              Text("RotatedBox的变换是在layout阶段，会影响在子widget的位置和大小"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    ///将Transform.rotate换成 RotateBox
                    child: RotatedBox(
                      quarterTurns: 1,  //旋转90度
                      child: Text("绘制不影响布局"),
                    ),
                  ),
                  Text(
                    "对比文字",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
