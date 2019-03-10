import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_actual_combat/custom_widgets/GradientCircularProgressIndicator.dart';
import 'package:flutter_app/main.dart';

class GradientCircularProgressPage extends StatefulWidget {
  @override
  _GradientCircularProgressPageState createState() =>
      _GradientCircularProgressPageState();
}

class _GradientCircularProgressPageState
    extends State<GradientCircularProgressPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    bool isForward = true;
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addStatusListener((status) {
            if (status == AnimationStatus.forward) {
              isForward = true;
            } else if (status == AnimationStatus.completed ||
                status == AnimationStatus.dismissed) {
              if (isForward) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            } else if (status == AnimationStatus.reverse) {
              isForward = false;
            }
          });
    _controller.forward();
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
        title: Title(color: Colors.red, child: Text("实例：圆形渐变进度条（自绘）")),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("实现一个圆形渐变进度条，它支持："),
        Padding10Text("1.支持多种渐变色。\n"
            "2.任意弧度；整个进度可以不是整圆。\n"
            "3.可以自定义粗细、两端是否圆角等样式。\n"
            "这样子的进度条是无法通过现有组件组合而成的，所以通过自绘的方式实现"),
        AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GradientCircularProgressIndicator(
                  // No gradient
                  colors: [Colors.blue, Colors.blue],
                  radius: 50.0,
                  stokeWidth: 3.0,
                  value: _controller.value,
                ),
                GradientCircularProgressIndicator(
                  colors: [Colors.red, Colors.orange],
                  radius: 50.0,
                  stokeWidth: 3.0,
                  value: _controller.value,
                ),
                GradientCircularProgressIndicator(
                  colors: [Colors.red, Colors.orange, Colors.red],
                  radius: 50.0,
                  stokeWidth: 5.0,
                  value: _controller.value,
                ),
                GradientCircularProgressIndicator(
                  colors: [Colors.teal, Colors.cyan],
                  radius: 50.0,
                  stokeWidth: 5.0,
                  strokeCapRound: true,
                  backgroundColor: Colors.yellow[100],
                  value: CurvedAnimation(
                      parent: _controller,
                      curve: Curves.decelerate)
                      .value,
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: GradientCircularProgressIndicator(
                      colors: [Colors.blue[700], Colors.blue[200]],
                      radius: 50.0,
                      stokeWidth: 3.0,
                      strokeCapRound: true,
                      backgroundColor: Colors.transparent,
                      value: _controller.value),
                ),
                GradientCircularProgressIndicator(
                  colors: [
                    Colors.red,
                    Colors.amber,
                    Colors.cyan,
                    Colors.green[200],
                    Colors.blue,
                    Colors.red
                  ],
                  radius: 50.0,
                  stokeWidth: 5.0,
                  strokeCapRound: true,
                  value: _controller.value,
                ),
              ],
            );
          },
        ),
      ]),
    );
  }
}
