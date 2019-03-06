import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///Flutter 文本以及样式

class TextStyleRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本及样式"),
      ),
      body: Column(
        // Column 是一个竖直方向设置多个widget的列表
        children: <Widget>[
          Text(
            "textAlign:文本的对齐方式，left" * 2,
            textAlign: TextAlign.left,
          ),
          Text(
            "textAlign:文本的对齐方式，center" * 2,
            textAlign: TextAlign.center,
          ),
          Text(
            "maxLines、overflow：指定文本显示的最大行数，默认情况下，文本是自动折行的，如果指定此参数，则文本最多不会超过指定的行。如果有多余的文本，可以通过overflow来指定截断方式，默认是直接截断，本例中指定的截断方式TextOverflow.ellipsis，它会将多余文本截断后以省略符“...”表示；TextOverflow的其它截断方式请参考SDK文档。",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "textScaleFactor：字体大小缩放因子，相对于设置TextStyle属性fontSize是一种调节字体大小的快捷方式",
            textScaleFactor: 1.5,
          ),
          Text(
            "TextStyle：用于修饰文字的样式，例如字体样式、颜色，行高，背景色，辅助线，大小等等",
            style: TextStyle(
                //文字颜色
                color: Colors.teal,
                //文字大小
                fontSize: 25,
                //行高
                height: 1.2,
                // 应该是字体样式（宋体、楷体之类的）
                fontFamily: "Courier",
                // 背景样色
                background: Paint()..color = Colors.yellow,
                //辅助线位置，
                decoration: TextDecoration.underline,
                //辅助线样式，
                decorationStyle: TextDecorationStyle.wavy),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "TextSpan:"),
            TextSpan(
                text: "富文本样式",
                style: TextStyle(color: Colors.blue, fontSize: 20)),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
              // TODO: 手势识别后面补上
              //recognizer:_handleRecognizer()
            )
          ])),
          DefaultTextStyle(
            //1.设置默认样式，在这个之中的文本都会默认继承使用
            style: TextStyle(color: Colors.redAccent, fontSize: 18),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("通过DefaultTextStyle继承设置的默认样式"),
                Text("继承DefaultTextStyle的默认样式"),
                Text(
                  "不继承默认样式，从新定义样式",
                  style: TextStyle(
                      // 设置不继承默认样式
                      inherit: false,
                      color: Colors.deepPurple),
                ),
              ],
            ),
          ),
          Text(
            "使用自定义下载的字体" * 3,
            style: TextStyle(fontFamily: 'KuaiLe'),
          ),
          Text(
            "使用自定义下载的字体2" * 3,
            style: TextStyle(fontFamily: 'XiaoWei'),
          ),
        ],
      ),
    );
  }
}
