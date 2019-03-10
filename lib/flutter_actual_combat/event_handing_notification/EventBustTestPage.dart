import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/flutter_actual_combat/event_handing_notification/EventBus.dart';

class EventBusTestPage extends StatefulWidget {
  @override
  _EventBusTestPageState createState() => _EventBusTestPageState();
}


class _EventBusTestPageState extends State<EventBusTestPage> {
  String _evaluation = "收到的评价：\n";


  //构造函数的时候加入监听
  _EventBusTestPageState(){
    bus.add("A", (arg){
      _evaluation+="A:"+arg+"\n";
    });
    bus.add("B", (arg){
      _evaluation+="B:"+arg+"\n";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("全局事件总线"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("事件总线:"),
        Padding10Text(
            "在APP中，我们经常会需要一个广播机制，用以跨页面事件通知，比如一个需要登录的APP中，页面会关注用户登录或注销事件，来进行一些状态更新。这时候，一个事件总线便会非常有用，事件总线通常实现了订阅者模式，订阅者模式包含发布者和订阅者两种角色，可以通过事件总线来触发事件和监听事件，本节我们实现一个简单的全局事件总线，我们使用单例模式"),
        KuaiLePadding10Text(
          "注意：Dart中实现单例模式的标准做法就是使用static变量+工厂构造函数的方式，这样就可以保证new EventBus()始终返回都是同一个实例",
          mycolor: Colors.red,
        ),
        KuaiLePadding10Text("示例："),
        Padding10Text("通过'事件总线'模拟当前页面用于接收用户评价："),
        Padding10Text(_evaluation),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AUser();
            }));
          },
          child: Text("A用户"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BUser();
            }));
          },
          child: Text("B用户"),
        ),
      ]),
    );
  }
}

class AUser extends StatefulWidget {
  @override
  _AUserState createState() => _AUserState();
}

class _AUserState extends State<AUser> {
  TextEditingController _controller = TextEditingController();
  String _hitText = "输入您的评价";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A用户"),
      ),
      body: ScrollBarColumBody(<Widget>[
        TextField(
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(
              labelText: "您的评价",
              hintText: _hitText,
              prefixIcon: Icon(
                Icons.event_note,
                color: Colors.blue,
              )),
        ),
        RaisedButton(
          onPressed: () {
            var arg = _controller.text.toString();
            setState(() {
              _controller.clear();
              _hitText = "评价已提交，可以继续输入";
            });
            bus.emit("A", arg);
          },
          child: Text("提交评价"),
        ),
      ]),
    );
  }
}

class BUser extends StatefulWidget {
  @override
  _BUserState createState() => _BUserState();
}

class _BUserState extends State<BUser> {
  TextEditingController _controller = TextEditingController();
  String _hitText = "输入您的评价";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B用户"),
      ),
      body: ScrollBarColumBody(<Widget>[
        TextField(
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(
              labelText: "您的评价",
              hintText: _hitText,
              prefixIcon: Icon(
                Icons.event_note,
                color: Colors.blue,
              )),
        ),
        RaisedButton(
          onPressed: () {
            var arg = _controller.text.toString();
            setState(() {
              _controller.clear();
              _hitText = "评价已提交，可以继续输入";
            });
            bus.emit("B", arg);
          },
          child: Text("提交评价"),
        ),
      ]),
    );
  }
}
