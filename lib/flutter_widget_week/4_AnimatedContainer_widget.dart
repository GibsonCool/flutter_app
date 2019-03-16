import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekAnimatedContainerWidgetPage extends StatefulWidget {
  @override
  _WeekAnimatedContainerWidgetPageState createState() =>
      _WeekAnimatedContainerWidgetPageState();
}

class _WeekAnimatedContainerWidgetPageState
    extends State<WeekAnimatedContainerWidgetPage> {
  double paddTop = 100.0;
  double logoSize = 100.0;
  Color colorvalue = Colors.deepOrange;
  double _radius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: ScrollBarColumBody([
        Text(
            'AnimatedContainer看名字不难知道它是Container的动画版本，使用AnimatedContainer就不需要再创建Animation了。'
                'AnimatedContainer继承于ImplicitlyAnimatedWidget，相应的我们需要传入动画的播放时间（必须填写）和插值器类型（有默认值）'
                '然后，我们就可以让AnimatedContainer根据我们的值来做动画效果并且作用到相应的属性上。'),
        AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          alignment: Alignment.center,
          child: Image.asset('images/IMG_0808.JPG',width: 70,height: 70,),
          width: logoSize,
          height: logoSize,
          margin: EdgeInsets.only(top: paddTop),
          decoration: BoxDecoration(color: colorvalue,borderRadius: BorderRadius.circular(_radius)),
        ),
        SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              paddTop = paddTop == 0 ? 100.0 : 0.0;
            });
          },
          child: Text("改变marging"),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              logoSize = logoSize == 50.0 ? 100.0 : 50.0;
            });
          },
          child: Text("改变大小"),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              colorvalue = colorvalue == Colors.deepOrange ? Colors.deepPurpleAccent : Colors.deepOrange;
            });
          },
          child: Text("改变背景颜色"),
        ), RaisedButton(
          onPressed: () {
            setState(() {
              _radius = _radius == 0.0 ? 120.0 : 0.0;
            });
          },
          child: Text("改变背景形状"),
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              logoSize = logoSize == 50.0 ? 100.0 : 50.0;
              paddTop = paddTop == 0 ? 100.0 : 0.0;
              colorvalue = colorvalue == Colors.deepOrange ? Colors.deepPurpleAccent : Colors.deepOrange;
              _radius = _radius == 0.0 ? 120.0 : 0.0;
            });
          },
          child: Text("同时改变大小和Padding、颜色、形状"),
        ),
        
      ]),
    );
  }
}
