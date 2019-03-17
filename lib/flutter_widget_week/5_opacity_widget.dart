import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekOpacityWidgetPage extends StatefulWidget {
  @override
  _WeekOpacityWidgetPageState createState() => _WeekOpacityWidgetPageState();
}

class _WeekOpacityWidgetPageState extends State<WeekOpacityWidgetPage> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opacity"),
      ),
      body: ScrollBarColumBody([
        Text(
            'Opacity : 如果想让一个组件在布局中保持位置不变。并且不显示布局只是占位。类似Android中的View.INVISIBLE效果，可以使用Opacity设置一个透明度值'
                '还可以使用AnimatedOpacity来创建动画'),
        redBox('没有设置Opacity'),
        SizedBox(
          height: 10.0,
        ),
        Opacity(
          opacity: 0.2,
          child: redBox('opacity:0.2'),
        ),
        SizedBox(
          height: 10.0,
        ),
        Opacity(
          opacity: 0.6,
          child: redBox('opacity:0.6'),
        ),
        SizedBox(
          height: 10.0,
        ),
        Opacity(
          opacity: 1,
          child: redBox('opacity:1'),
        ),
        SizedBox(
          height: 10.0,
        ),
        redBox('3'),
        SizedBox(
          height: 10.0,
        ),
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2),
          curve: Curves.linear,
          child: redBox("AnimatedOpacity 控制透明变化"),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              _opacity = _opacity == 0.0 ? 1.0 : 0.0;
            });
          },
          child: Text("改变透明度"),
        )
      ]),
    );
  }

  Widget redBox(String value) {
    return Container(
      color: Colors.red,
      width: 100,
      height: 80,
      alignment: Alignment.center,
      child: Text(value),
    );
  }
}
