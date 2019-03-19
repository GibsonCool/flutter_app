import 'dart:convert';

import 'package:flutter/material.dart';



class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新页面"),
      ),
      body: Center(
        child: Text("This is a new route"),
      ),
    );
  }
}

//带参数传递的页面
class PrintRoute extends StatelessWidget {
  final String tip;

  //构造函数
  PrintRoute(this.tip);


  @override
  Widget build(BuildContext context) {
    ///由于这个库在拼接链接的时候不支持中文字符，所以要进行参数转码
    var list = List<int>();
    jsonDecode(tip).forEach(list.add);
    final String result = Utf8Decoder().convert(list);

    return Scaffold(
      appBar: AppBar(
        title: Text("打印和显示传递过来的参数"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(result),
            TapboxA(),
            ParentWidget(),
            ParentWidgetC()
          ],
        ),
      ),
    );
  }
}

/// 通过几个widget来展示widget中State状态管理三种方式
/// 1、widget自己管理  2、父widget管理  3、混合管理

//------------------------- TapboxA  widget管理自身状态 ----------------------------------
//TapboxA 管理自身状态
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() => setState(() {
        _active = !_active;
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

//------------------------- ParentWidget 父Widget管理子widget的state ----------------------------------
// ParentWidget 为 TapboxB 管理状态。
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handTapboxChanged(bool newValue) => setState(() {
        _active = newValue;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TapboxB(active: _active, onChanged: _handTapboxChanged),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Activie' : 'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.amber),
          ),
        ),
        width: 100,
        height: 100,
        decoration:
            BoxDecoration(color: active ? Colors.lightGreen : Colors.grey),
      ),
    );
  }
}

//------------------------- ParentWidget 混合管理 ----------------------------------
class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        onChanged: _handTapboxChanged,
        active: _active,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  _TapboxCState createState() => _TapboxCState();
}

// 文字状态交友父widget来管理，这是父widget比较关心的。至于点击的各种效果自己管理这与父widget无任何强关联
class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() => widget.onChanged(!widget.active);

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框抬起是取消高亮效果
    return GestureDetector(
      onTapDown: _handleTapDown,
      // 处理按下事件
      onTapUp: _handleTapUp,
      //处理抬起事件
      onTap: _handleTap,
      // 处理点击事件
      onTapCancel: _handleTapCancel,
      // 处理点击事件取消
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen : Colors.grey,
            border:
                _highlight ? Border.all(color: Colors.teal, width: 10) : null),
      ),
    );
  }
}
