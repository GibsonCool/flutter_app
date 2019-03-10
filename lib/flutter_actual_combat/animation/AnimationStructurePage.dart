import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class AnimationStructurePage extends StatefulWidget {
  @override
  _AnimationStructurePageState createState() => _AnimationStructurePageState();
}

class _AnimationStructurePageState extends State<AnimationStructurePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画基本结构"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("动画基本结构："),
        Padding10Text("通过一个图片逐渐放大的延时动画实现基本结构："),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScaleAnimationRoute();
            }));
          },
          child: Text("查看示例"),
        ),
        Padding10Text(
            "上面的例子中并没有指定Curve，所以放大的过程是线性的（匀速），下面我们指定一个Curve，来实现一个类似于弹簧效果的动画过程"),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScaleAnimationRoute(
                openCurves: true,
              );
            }));
          },
          child: Text("开启Curve查看示例"),
        ),
        KuaiLePadding10Text("使用AnimatedWidget简化:"),
        Padding10Text(
            "上面示例中通过addListener()和setState() 来更新UI这一步其实是通用的，如果每个动画中都加这么一句是比较繁琐的。AnimatedWidget类封装了调用setState()的细节，并允许我们将Widget分离出来，重构后的代码实现"),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AnimatedWidgetScalePage();
            }));
          },
          child: Text("AnimatedWidge简化示例"),
        ),
        KuaiLePadding10Text("用AnimatedBuilder重构:"),
        Padding10Text(
            "用AnimatedWidget可以从动画中分离出widget，而动画的渲染过程（即设置宽高）仍然在AnimatedWidget中，"
            "而AnimatedBuilder正是将渲染逻辑分离出来,他会带来三个好处：\n"
            "1、不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。\n"
            "2、动画构建的范围缩小了，如果没有builder，setState()将会在父widget上下文调用，这将会导致父widget的build方法重新调用，而有了builder之后，只会导致动画widget的build重新调用，这在复杂布局下性能会提高。\n"
            "3、通过AnimatedBuilder可以封装常见的过渡效果来复用动画。下面我们通过封装一个GrowTransition来说明，它可以对子widget实现放大动画\n"),
        Padding10Text(
          "Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、SizeTransition、FractionalTranslation等，很多时候都可以复用这些预置的过渡类。",
          mycolor: Colors.red,
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AnimatedBuilderScalePage();
            }));
          },
          child: Text("AnimatedBuilder重构示例"),
        ),

        KuaiLePadding10Text("动画状态监听："),
        Padding10Text(
            "们可以通过Animation的addStatusListener()方法来添加动画状态改变监听器。Flutter中，有四种动画状态，在AnimationStatus枚举类中定义\n"
            "dismissed：动画在起始点停止\n"
            "forward：动画正在正向执行\n"
            "reverse：动画正在反向执行\n"
            "completed：动画在终点停止\n"),
        Padding10Text("监听动画状态的改变，在动画正向执行结束时反转动画，在动画反向执行结束时再正向执行动画。"),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return AnimatedBuilderScalePage(openStatusListener: true,);
            }));
          },
          child: Text("监听变化示例"),
        ),
      ]),
    );
  }
}

///缩放动画示例
class ScaleAnimationRoute extends StatefulWidget {
  final bool _openCurves;

  ScaleAnimationRoute({openCurves = false}) : _openCurves = openCurves;

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

///需要继承TickerProvider,如果有多个AnimationController，则应该使用TickerProviderStateMixin
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    //是否使用弹性曲线
    if (widget._openCurves)
      animation =
          CurvedAnimation(parent: controller, curve: Curves.bounceInOut);

    //图片宽高变化区间（Tween）从0到300
    animation = Tween(begin: 0.0, end: 300.0)
        .animate(!widget._openCurves ? controller : animation)
          ..addListener(() {
            setState(() => {});
          });
    //启动动画（forward正向执行）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "images/test.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    //路由销毁时候释放动画资源
    controller.dispose();
    super.dispose();
  }
}

///AnimatedWidget 简化
class AnimatedImage extends AnimatedWidget {
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "images/test.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
}

class AnimatedWidgetScalePage extends StatefulWidget {
  @override
  _AnimatedWidgetScalePageState createState() =>
      _AnimatedWidgetScalePageState();
}

class _AnimatedWidgetScalePageState extends State<AnimatedWidgetScalePage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: .0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(
      animation: animation,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

///使用AnimatedBuilder重构
class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: Image.asset("images/test.jpg"),
      ),
    );
  }
}

class AnimatedBuilderScalePage extends StatefulWidget {
  bool _openStatusListener;


  AnimatedBuilderScalePage({bool openStatusListener = false}):_openStatusListener = openStatusListener;

  @override
  _AnimatedBuilderScalePageState createState() =>
      _AnimatedBuilderScalePageState();
}

class _AnimatedBuilderScalePageState extends State<AnimatedBuilderScalePage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: widget._openStatusListener?1:3));
    animation = Tween(begin: .0, end: 300.0).animate(controller);
    if(widget._openStatusListener)
      animation.addStatusListener((status){
        if(status == AnimationStatus.completed){
          //动画执行结束时候反向执行动画
          controller.reverse();
        }else if(status == AnimationStatus.dismissed){
          //动画恢复到初始状态时正向执行动画
          controller.forward();
        }
      });
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: Image.asset("images/test.jpg"),
      animation: animation,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
