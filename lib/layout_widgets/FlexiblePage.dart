import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class FlexiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局Flex"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: KuaiLeText('Flex的两个子widget按照1:2来占据水平方向空间'),
          ),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: KuaiLeText('Flex的三个子widget，在垂直方向按2：1：1来占用200像素的空间'),
          ),
          SizedBox(
            height: 200,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.indigoAccent,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
