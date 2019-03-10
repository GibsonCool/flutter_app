import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class InheritedWidgetTestPage extends StatefulWidget {
  @override
  _InheritedWidgetTestPageState createState() =>
      _InheritedWidgetTestPageState();
}

class _InheritedWidgetTestPageState extends State<InheritedWidgetTestPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据共享-InheritedWidget"),
      ),
      body: ShareDataWidget(
        ///  使用ShareDataWidge共享数据count
        data: count,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              KuaiLePadding10Text("InheritedWidget:"),
              Padding10Text("InheritedWidget是Flutter中非常重要的一个功能型Widget，"
                  "它可以高效的将数据在Widget树中向下传递、共享，"
                  "这在一些需要在Widget树中共享数据的场景中非常方便，"
                  "如Flutter中，正是通过InheritedWidget来共享应用主题(Theme)和Locale(当前语言环境)信息的"),
              Padding(
                padding: const EdgeInsets.all(20),
                child: _TestWidget(),
              ),
              RaisedButton(
                  child: Text("点击增加"),
                  onPressed: () => setState(() => ++count)),
            ],
          ),
        ),
      ),
    );
  }
}

/*
*  继承InheritedWidge ，将当前计数器点击次数保存在ShareDataWidget的data属性中
* */
class ShareDataWidget extends InheritedWidget {
  //需要在子树种共享的数据，保存点击次数
  int data;

  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  //定义一个便捷方法，方便字数中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树种依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

///
class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change 依赖改变");
  }
}
