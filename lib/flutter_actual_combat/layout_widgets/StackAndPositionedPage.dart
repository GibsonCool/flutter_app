import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class StackAndPositionedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局Stack、Positioned"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding10Text("Stack类似Android中的Frame，通过Positioned来确定子widget的位置"),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                ///指定未定位或部分定位widget的对齐方式:居中对齐
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    child: Text("未使用Positioned Alignment.center",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 18.0,
                    top: 50.0,
                    child: Text("left:18 top:50"),
                  ),
                  Positioned(
                    left: 18.0,
                    child: Text("left:18"),
                  ),
                  Positioned(
                    top: 18.0,
                    child: Text("top:18"),
                  ),
                  Positioned(
                    top: 30,
                    right: 30,
                    child: Text("top:30 right:30"),
                  ),
                ],
              ),
            ),
            Padding10Text("调整一下未指定positioned的Widget的顺序，设置fit为未指定填充满Stack"),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                //未定位widget占满Stack整个空间
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                    left: 18.0,
                    top: 50.0,
                    child: Text("left:18 top:50"),
                  ),
                  Container(
                    child: Text(
                        "未使用Positioned Alignment.center StackFit.expand",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 18.0,
                    child: Text("left:18"),
                  ),
                  Positioned(
                    top: 18.0,
                    child: Text("top:18"),
                  ),
                  Positioned(
                    top: 30,
                    right: 30,
                    child: Text("top:30 right:30"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
