import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekFadeTransition extends StatefulWidget {
  @override
  _WeekFadeTransitionState createState() => _WeekFadeTransitionState();
}

class _WeekFadeTransitionState extends State<WeekFadeTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool fadeIn = false; //动画执行标记

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
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
        title: Text("FadeTransition"),
      ),
      body: ScrollBarColumBody([
        Text("当您只是寻找简单的转场并且不需要使用 Flutter 中更强大的动画时，请尝试使用FadeTransition 小部件！"
            " FadeTransition 可让您轻松淡入淡出小部件，并且可以直接放入Flutter 应用程序。\n点击下面色块查看效果"),
        Center(
          child: GestureDetector(
            onTap: () {
              if (fadeIn)
                _controller.forward();
              else
                _controller.reverse();
              fadeIn = !fadeIn;
            },
            child: FadeTransition(
              opacity: _animation, //透明度
              child: Container(
                height: 200,
                width: 200,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
