import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class StaggeredAnimationPage extends StatefulWidget {
  @override
  _StaggeredAnimationPageState createState() => _StaggeredAnimationPageState();
}

class _StaggeredAnimationPageState extends State<StaggeredAnimationPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  ///Dart类库中有非常多返回Future或者Stream对象的函数，这些函数被称为"异步函数"：它们只会在设置好一些耗时操作之后返回，比如像 IO操作。
  ///async和await关键词支持了异步编程，让异步代码可以像写同步代码一样，例如下面👇
  ///
  ///
  ///async 用来表示函数是异步的，定义的函数会返回一个Future对像
  ///await 后面是一个Future,表示等待该异步任务完成，才会往下走；await必须出现在async修饰的函数内部。
  ///
  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //在反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print("动画还在执行中别去取消了，可能是我们调用了disposed退出了当前页");
    }
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
        title: Text("交错动画"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("交错动画(Stagger Animation)："),
        Padding10Text(
            "些时候我们可能会需要一些复杂的动画，这些动画可能由一个动画序列或重叠的动画组成，比如：有一个柱状图，需要在高度增长的同时改变颜色，等到增长到最大高度后，我们需要在X轴上平移一段距离。这时我们就需要使用交错动画（Stagger Animation）。交错动画需要注意以下几点："),
        Padding10Text(
          "1.要创建交错动画，需要使用多个动画对象\n"
              "2.一个AnimationController控制所有动画\n"
              "3.给每一个动画对象指定间隔（Interval）\n",
          mycolor: Colors.red,
        ),
        Padding10Text(
            "所有动画都由同一个AnimationController驱动，无论动画实时持续多长时间，控制器的值必须介于0.0和1.0之间，而每个动画的间隔（Interval）介于0.0和1.0之间。对于在间隔中设置动画的每个属性，请创建一个Tween。 Tween指定该属性的开始值和结束值。也就是说0.0到1.0代表整个动画过程，我们可以给不同动画指定起始点和终止点来决定它们的开始时间和终止时间"),
        GestureDetector(
          //整个区域都响应点击事件
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _playAnimation();
          },
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              border: Border.all(color: Colors.black.withOpacity(.5)),
            ),
            child: StaggeredAnimation(
              controller: _controller,
            ),
          ),
        ),
        KuaiLePadding10Text(
          "交错动画本质就是多个Animation使用了同一个AnimationController，并且还可以通过Interval为每个动画指定整个动画过程的起始点和终点。",
          mycolor: Colors.redAccent,
        ),
      ]),
    );
  }
}

///执行交错动画的widget
class StaggeredAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<EdgeInsets> paddingAnimation;
  Animation<double> heightAnimation;
  Animation<Color> colorAnimation;

  StaggeredAnimation({Key key, this.controller}) : super(key: key) {
    //高度变化动画
    heightAnimation = Tween(begin: .0, end: 200.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(.0, .6, curve: Curves.ease)));
    //颜色变化动画
    colorAnimation = ColorTween(begin: Colors.red[300], end: Colors.blue[300])
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(.0, .6, curve: Curves.ease)));
    //位置padding变化动画
    paddingAnimation =
        Tween(begin: EdgeInsets.only(left: 0), end: EdgeInsets.only(left: 100))
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(.5, 1.0, curve: Curves.ease)));
  }

  //定义一个创建Widget的方法
  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: paddingAnimation.value,
      child: Container(
        width: 50,
        height: heightAnimation.value,
        color: colorAnimation.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //通过AnimatedBuilder创建动画效果
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
