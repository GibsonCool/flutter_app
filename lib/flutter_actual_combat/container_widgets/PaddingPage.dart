import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding的使用"),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          //显示指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 50,
                child: Text("EdgeInsets.only(left: 8) 距离左边8像素补白"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                width: double.infinity,
                color: Colors.green,
                height: 50,
                child: Text("EdgeInsets.symmetric(vertical: 8) 距离上下各8像素补白"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                height: 50,
                child: Text("EdgeInsets.fromLTRB(20,15,20,15)  分别指定四个方向距离"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
