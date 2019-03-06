import 'package:flutter/material.dart';

// 自定义按钮常见属性
//const FlatButton({
//    @required this.onPressed, //按钮点击回调
//    this.textColor, //按钮文字颜色
//    this.disabledTextColor, //按钮禁用时的文字颜色
//    this.color, //按钮背景颜色
//    this.disabledColor,//按钮禁用时的背景颜色
//    this.highlightColor, //按钮按下时的背景颜色
//    this.splashColor, //点击时，水波动画中水波的颜色
//    this.colorBrightness,//按钮主题，默认是浅色主题
//    this.padding, //按钮的填充
//    this.shape, //外形
//    @required this.child, //按钮的内容
//})

//const RaisedButton({
//...
//this.elevation = 2.0, //正常状态下的阴影
//this.highlightElevation = 8.0,//按下时的阴影
//this.disabledElevation = 0.0,// 禁用时的阴影
//...
//}

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("按钮"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "RaisedButton '漂浮' 按钮。默认带有阴影和灰色背景",
                  textScaleFactor: 0.8,
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text(
                  "RaisedButton 未设置onPressed 按钮处于禁用状态",
                  textScaleFactor: 0.8,
                ),
//                onPressed: () {},
              ),
              FlatButton(
                child: Text("FlatButton 扁平按钮默认背景透明不带阴影"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("FlatButton 未设置onPressed"),
//                onPressed: () {},
              ),
              OutlineButton(
                child: Text("OutLineButton 背景透明无阴影 有默认边框"),
                onPressed: () {},
              ),
              OutlineButton(
                child: Text("OutLineButton 未设置onPressed"),
//                onPressed: () {},
              ),
              // 一个可点击的Icon  不包括文字，默认没有背景，点击有背景效果
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("自定义 FlatButton 样式"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text("自定义 RaisedButton 样式"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                elevation: 10,
                highlightElevation: 15,
              )
            ],
          ),
        ));
  }
}
