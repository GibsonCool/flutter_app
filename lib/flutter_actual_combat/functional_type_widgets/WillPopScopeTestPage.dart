import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WillPopScopeTestPage extends StatefulWidget {
  @override
  _WillPopScopeTestPageState createState() => _WillPopScopeTestPageState();
}

class _WillPopScopeTestPageState extends State<WillPopScopeTestPage> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航返回拦截WillPopScope"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("WillPopScope:"),
        Padding10Text("很多APP中都拦截了用户点击返回键的按钮,Flutter中可以通过WillPopScope来实现返回按钮拦截,"
            "改Widget有一个回调函数onWillPop，当用户点击返回按钮时调用（包括导航返回按钮及Android物理返回按钮）"
            "，该回调需要返回一个Future对象，如果返回的Future最终值为false时，则当前路由不出栈(不会返回)"
            "，最终值为true时，当前路由出栈退出。我们需要提供这个回调来决定是否退出。"),
        WillPopScope(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "1秒内连续按两次返回键退出",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 1)) {
              _lastPressedAt = DateTime.now();
              return false;
            } else {
              return true;
            }
          },
        ),
      ]),
    );
  }
}
