import 'package:flutter/material.dart';

class RowAndColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局Row和Column"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "主轴和纵轴:",
              textScaleFactor: 2.0,
              style: TextStyle(fontFamily: 'KuaiLe'),
            ),
            Text(
              "        对于线性布局，有主轴和纵轴之分，如果布局是沿水平方，那么主轴就指是水平方向，"
                  "而纵轴即垂直方向；如果布局沿垂直方向，那么主轴就是指垂直方向，而纵轴就是水平方向。"
                  "在线性布局中，有两个定义对齐方式的枚举类MainAxisAlignment和CrossAxisAlignment，"
                  "分别代表主轴对齐和纵轴对齐。",
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
            ),
            Column(
              //测试Row的对齐方式，排除Column默认居中对齐的干扰
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Row属性示例:",
                  textScaleFactor: 2.0,
                  style: TextStyle(fontFamily: 'KuaiLe'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" MainAxisAlignment.center"),
                    Text(" 其他属性默认"),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" MainAxisAlignment.center"),
                    Text(" MainAxisSize.min"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text(" MainAxisAlignment.end"),
                    Text(" TextDirection.rtl"),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    Text(
                      " hello world",
                      textScaleFactor: 3,
                    ),
                    Text(" I am Jack"),
                  ],
                ),
              ],
            ),
            Text(
              "Column可以在垂直方向排列其子widget。参数和Row一样，不同的是布局方向为垂直，主轴纵轴正好相反，读者可类比Row来理解",
              textScaleFactor: 1.2,
              style: TextStyle(fontFamily: 'KuaiLe'),
            ),
            Text(
              "特殊情况:",
              textScaleFactor: 2.0,
              style: TextStyle(fontFamily: 'KuaiLe'),
            ),
            Text(
                "如果Row里面嵌套Row，或者Column里面再嵌套Column，那么只有对最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小，下面以Column为例说明："),
            Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Column 中嵌套 Column"),
                  onPressed: () {
                    //导航到新路由页面
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ColumnNestingColumn();
                    }));
                  },
                ),
                RaisedButton(
                  child: Text("Column 中嵌套 Column fix"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ColumnNestingColumnFix();
                    }));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

///嵌套Column
class ColumnNestingColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column 中嵌套 Column"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, // 有效，外层Column高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, //无效，内层Column高度为实际文字填充的大小
                  children: <Widget>[
                    Text(
                      " hello world",
                      textScaleFactor: 3,
                    ),
                    Text(" I am Jack"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///嵌套Column修正版本
class ColumnNestingColumnFix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded解决嵌套Column"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, // 有效，外层Column高度为整个屏幕
            children: <Widget>[
              ///如果要让里面的Column沾满外部的Column使用Expanded包裹
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,//垂直方向居中显示
                    children: <Widget>[
                      Text(
                        " hello world",
                        textScaleFactor: 3,
                      ),
                      Text(" I am Jack"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
