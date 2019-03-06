import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ScrollConstrollerListenerTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听及控制ScrollController"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("ScrollController:"),
        Padding10Text(
            "ScrollController间接继承自Listenable，我们可以根据ScrollController来监听滚动事件\n"
            "示例:创建一个ListView，监听滚动变化，当位置超过1000像素，右下角显示'返回顶部'按钮否则隐藏，点击回到初始位置"),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScrollConstrollerRoute();
            }));
          },
          child: Text("查看示例"),
        ),
        KuaiLePadding10Text("PageStorage:"),
        Padding10Text("PageStorage是一个用于保存页面(路由)相关数据的Widget，它并不会影响子树的UI外观，"
            "其实，PageStorage是一个功能型Widget，它拥有一个存储桶（bucket），"
            "子树中的Widget可以通过指定不同的PageStorageKey来存储各自的数据或状态\n"
            "每次滚动结束，Scrollable Widget都会将滚动位置offset存储到PageStorage中，"
            "当Scrollable Widget 重新创建时再恢复。如果ScrollController.keepScrollOffset为false，"
            "则滚动位置将不会被存储，Scrollable Widget重新创建时会使用ScrollController.initialScrollOffset；"
            "ScrollController.keepScrollOffset为true时，Scrollable Widget在第一次创建时，"
            "会滚动到initialScrollOffset处，因为这时还没有存储过滚动位置。在接下来的滚动中就会存储、恢复滚动位置，"
            "而initialScrollOffset会被忽略。"),
        KuaiLePadding10Text("NotificationListener:"),
        Padding10Text(
            "otificationListener是一个Widget，模板参数T是想监听的通知类型，如果省略，则所有类型通知都会被监听，"
            "如果指定特定类型，则只有该类型的通知会被监听。NotificationListener需要一个onNotification回调函数，"
            "用于实现监听处理逻辑，该回调可以返回一个布尔值，代表是否阻止该事件继续向上冒泡，如果为true时，则冒泡终止，"
            "事件停止向上传播，如果不返回或者返回值为false 时，则冒泡继续"),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScrollNotificationTestRoute();
            }));
          },
          child: Text("示例:监听滚动，显示进度百分比"),
        ),
      ]),
    );
  }
}

/* 滚动监听示例 */
class ScrollConstrollerRoute extends StatefulWidget {
  @override
  _ScrollConstrollerRouteState createState() => _ScrollConstrollerRouteState();
}

class _ScrollConstrollerRouteState extends State<ScrollConstrollerRoute> {
  ScrollController _constroller = ScrollController();
  bool showToTopBtn = false; //是否显示"返回顶部"顶部按钮标志位

  @override
  void initState() {
    super.initState();
    //添加监听事件
    _constroller.addListener(() {
      print("offset:${_constroller.offset}"); //打印滚动位置
      //调用offset获取滚动位置是否符合要求并刷新'返回顶部'状态
      if (_constroller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_constroller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //避免内存泄漏，释放资源
    _constroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController示例"),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Index : $index"),
            );
          },
          itemCount: 100,
          itemExtent: 50,
          controller: _constroller,
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                ///jumpTo(无动画) 或 animateTo(有动画)滚动到顶部
//                _constroller.jumpTo(0);
                _constroller.animateTo(0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
    );
  }
}

/* NotificationListener 滚动监听*/
class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //滚动百分比

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
          onNotification: (ScrollNotification notification){
            //使用pixels当前滚动位置除以maxScrollExtent最大可滚动长度
            double nowProgress = notification.metrics.pixels/notification.metrics.maxScrollExtent;
            //刷新重构建
            setState(() {
              _progress = "${(nowProgress*100).toInt()}%";
            });
            print("BottomEdge 是否滚动到底部:${notification.metrics.extentAfter==0}");
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
                  return ListTile(title: Text("index: $index"),);
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
            ],
          ),
        ),
      ),
    );
  }
}
