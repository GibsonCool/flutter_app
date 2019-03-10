import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container容器"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding10Text(
                  "Container是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget的一个组合widget"
                  "可以实现同时需要装饰、变换、限制的场景"),
              Container(
                margin: EdgeInsets.only(top: 10, left: 50),
                //容器外补白
                constraints: BoxConstraints.tightFor(width: 200, height: 150),
                //限制大小
                decoration: BoxDecoration(
                  //修饰背景
                  gradient: LinearGradient(
                    //水平方向渐变
                    colors: [
                      Colors.red,
                      Colors.deepOrange,
                      Colors.purpleAccent
                    ],
                  ),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                transform: Matrix4.rotationZ(0.2),
                //旋转
                alignment: Alignment.center,
                //文字居中
                child: Text(
                  "老铁666",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Padding(padding: EdgeInsets.all(25),),
              KuaiLePadding10Text("Padding 和 Margin的区别："),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.black54,
                    child: Container(
                      color: Colors.orange,
                      child: Text("null"),
                    ),
                  ),
                  Container(
                    color: Colors.black54,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      color: Colors.orange,
                      child: Text("Marging"),
                    ),
                  ),
                  Container(
                    color: Colors.black54,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.orange,
                      child: Text("Padding"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
