import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ThemeTestPage extends StatefulWidget {
  @override
  _ThemeTestPageState createState() => _ThemeTestPageState();
}

class _ThemeTestPageState extends State<ThemeTestPage> {
  Color _themeColor = Colors.teal; //当前路由主题色
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("主题-Theme"),
        ),
        body: ScrollBarColumBody(<Widget>[
          //这行Icon使用主题中的IconTheme
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.local_airport),
              Text("  颜色跟随主题"),
            ],
          ),
          //第二行Icon自定义主题颜色，覆盖父类固定为黑色
          Theme(
            data: themeData.copyWith(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.local_airport),
                Text("  颜色固定黑色"),
              ],
            ),
          ),

          Padding10Text("Theme内会使用InheritedWidget来为其子树Widget共享样式数据,"),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _themeColor =
              _themeColor == Colors.teal ? Colors.blue : Colors.teal),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
