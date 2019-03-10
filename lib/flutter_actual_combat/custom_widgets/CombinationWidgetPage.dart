import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class CombinationWidgetPage extends StatefulWidget {
  @override
  _CombinationWidgetPageState createState() => _CombinationWidgetPageState();
}

class _CombinationWidgetPageState extends State<CombinationWidgetPage> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("组合实现自定义Widget"),
      ),
      body: ScrollBarColumBody(<Widget>[
        Padding10Text(
            "在Flutter中页面UI通常都是由一些低阶别的Widget组合而成，当我们需要封装一些通用Widget时，应该首先考虑是否可以通过组合其它Widget来实现，如果可以则应优先使用组合，因为直接通过现有Widget拼装会非常方便、简单、高效。"),
        KuaiLePadding10Text("自定义渐变按钮示例："),
        GradientButton(
          colors: [Colors.orange, Colors.red],
          height: 50.0,
          child: Text("Submit"),
          onTap: onTap,
        ),
        GradientButton(
          height: 50.0,
          colors: [Colors.lightGreen, Colors.green[700]],
          child: Text("Submit"),
          onTap: onTap,
        ),
        GradientButton(
          height: 50.0,
          colors: [Colors.lightBlue[300], Colors.blueAccent],
          child: Text("Submit"),
          onTap: onTap,
        ),
        KuaiLePadding10Text("自定义旋转按钮TurnBox"),
        Padding10Text(
            "实现一个TurnBox，它可以以任意角度来旋转其子节点，并且在角度发生变化时可以执行一个动画过渡到新状态，同时，我们可以手动指定动画速度"),
        TurnBox(
          turns: _turns,
          speed: 500,
          child: Icon(
            Icons.refresh,
            size: 50,
          ),
        ),
        TurnBox(
          turns: _turns,
          speed: 1000,
          child: Icon(
            Icons.refresh,
            size: 100,
          ),
        ),
        RaisedButton(
          child: Text("顺时针旋转1/5圈"),
          onPressed: () =>
              setState(() =>  _turns = _turns==1? 1:_turns + .25),
        ),
        RaisedButton(
          child: Text("逆时针旋转1/5圈"),
          onPressed: () => setState(() =>_turns= _turns==0? 0 :  _turns - .25),
        ),
        KuaiLePadding10Text("总结："),
        Padding10Text(
            "通过组合的方式定义Widget和我们之前写界面并无差异，不过在抽离出单独的Widget时我们要考虑代码规范性，如必要参数要用@required 标注，对于可选参数在特定场景需要判空或设置默认值等。这是由于使用者大多时候可能不了解Widget的内部细节，所以为了保证代码健壮性，我们需要在用户错误地使用Widget时能够兼容或报错提示（使用assert断言函数）。"),
      ]),
    );
  }

  void onTap() {
    print("按钮别点击了");
  }
}

///自定义渐变按钮
class GradientButton extends StatelessWidget {
  //渐变色数组
  final List<Color> colors;

  //按钮跨高
  final double width;
  final double height;
  final Widget child;

  //点击回调
  final GestureTapCallback onTap;

  GradientButton(
      {this.colors, this.width, this.height, @required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //防止颜色传入为空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: _colors)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          splashColor: _colors.first,
          highlightColor: _colors.last,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///自定义可以任意角度旋转，并有过渡动画可以指定动画速度的box
class TurnBox extends StatefulWidget {
  final double turns; //旋转的"圈"数，一圈为360度，0.25就是90度
  final int speed; //动画执行的时间长度
  final Widget child;

  TurnBox({Key key, this.turns, this.speed, this.child}) : super(key: key);

  @override
  _TurnBoxState createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.speed));
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //当角度发生变化时执行过渡动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
  }
}
