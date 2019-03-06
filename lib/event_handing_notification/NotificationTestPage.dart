import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class NotificationTestPage extends StatefulWidget {
  @override
  _NotificationTestPageState createState() => _NotificationTestPageState();
}

class _NotificationTestPageState extends State<NotificationTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通知Notification"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("Notification："),
        Padding10Text(
            "Notification是Flutter中一个重要的机制，在Widget树中，每一个节点都可以分发通知，通知会沿着当前节点（context）向上传递，所有父节点都可以通过NotificationListener来监听通知，Flutter中称这种通知由子向父的传递为“通知冒泡”（Notification Bubbling），这个和用户触摸事件冒泡是相似的，但有一点不同：通知冒泡可以中止，但用户触摸事件不行。"),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScrollNotificationPage();
            }));
          },
          child: Text("ScrollNotification示例"),
        ),
        KuaiLePadding10Text("自定义通知："),
        Padding10Text("1、定义一个通知类，要继承自Notification类\n"
            "2、分发通知。\n"
            "  Notification有一个dispatch(context)方法，它是用于分发通知的，我们说过context实际上就是操作Element的一个接口，它与Element树上的节点是对应的，通知会从context对应的Element节点向上冒泡。"),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CustomeNotificationPage();
            }));
          },
          child: Text("查看示例"),
        ),
      ]),
    );
  }
}

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}

///自定义通知
class CustomeNotificationPage extends StatefulWidget {
  @override
  _CustomeNotificationPageState createState() =>
      _CustomeNotificationPageState();
}

class _CustomeNotificationPageState extends State<CustomeNotificationPage> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义通知"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding10Text(
                "NotificationListener是监听的子树,通过根Context分发通知是不能正常工作，所以我们通过Builder来构建RaisedButton，来获得按钮位置的context。",
                mycolor: Colors.red,
              ),
              RaisedButton(
                onPressed: () => MyNotification("Hi").dispatch(context),
                child: Text("根Context 发送Hi"),
              ),
              Builder(builder: (context) {
                return RaisedButton(
                  onPressed: () => MyNotification("Hello").dispatch(context),
                  child: Text("Builder构建 获取按钮位置的context 发送Hello"),
                );
              }),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }
}

/// Scrollable Widget 滚动监听
class ScrollNotificationPage extends StatefulWidget {
  @override
  _ScrollNotificationPageState createState() => _ScrollNotificationPageState();
}

class _ScrollNotificationPageState extends State<ScrollNotificationPage> {
  String _progress = "0%"; //滚动百分比
  String _scrollState = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationListener"),
      ),
      body: Scrollbar(
        //监听滚动通知
        child: NotificationListener(
          //实现监听处理逻辑，
          onNotification: (ScrollNotification notification) {
            //使用pixels当前滚动位置除以maxScrollExtent最大可滚动长度
            double nowProgress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //刷新重构建
            setState(() {
              _progress = "${(nowProgress * 100).toInt()}%";
            });
            print(
                "BottomEdge 是否滚动到底部:${notification.metrics.extentAfter == 0}");

            setState(() {
              switch (notification.runtimeType) {
                case ScrollStartNotification:
                  _scrollState = "开始滚动";
                  break;
                case ScrollUpdateNotification:
                  _scrollState = "正在滚动";
                  break;
                case ScrollEndNotification:
                  _scrollState = "滚动停止";
                  break;
                case OverscrollNotification:
                  _scrollState = "滚动到边界";
                  break;
              }
            });

            // 该回调可以返回一个布尔值，代表是否阻止该事件继续向上冒泡，
            // 如果为true时，则冒泡终止，事件停止向上传播，如果不返回或者返回值为false 时
            // ，则冒泡继续。跟Android的事件传递类似的思想
//            return true; //放开注释，则进度条失效，不会向上冒泡传递
          },
          //子widget
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("index: $index"),
                  );
                },
                itemCount: 100,
                itemExtent: 50,
              ),
              //用于显示百分比
              CircleAvatar(
                radius: 35,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
              Positioned(
                top: 200,
                child: KuaiLePadding10Text(
                  "当前状态：$_scrollState",
                  mycolor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
