import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class RawPointerEventPage extends StatefulWidget {
  @override
  _RawPointerEventPageState createState() => _RawPointerEventPageState();
}

class _RawPointerEventPageState extends State<RawPointerEventPage> {
  PointerEvent _event;
  PointerEvent _moveEvent;
  Color _themeColor = Colors.blue;
  int _inValue = 0;
  int _outValue = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("原始指针事件处理"),
        ),
        body: ScrollBarColumBody(<Widget>[
          KuaiLePadding10Text("Pointer事件处理:"),
          Padding10Text("Flutter中可以使用Listener widget来监听原始触摸事件，它也是一个功能性widget。"),
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: _themeColor,
              width: 300,
              height: 250,
              child: Text(
                //
                "在蓝色矩形区域内移动即可看到当前指针偏移\n\n"
                    "${_event?.toString() ?? 'null'}\n\n"
                    "position:全局坐标的偏移${_event?.position}\n\n"
                    "delta:两次指正移动时间(PointerMoveEvent)的距离${_moveEvent?.delta}\n\n"
                    "orientation:指针移动方向，是一个角度值${_event?.orientation}",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            onPointerDown: (PointerDownEvent event) =>
                setState(() => _event = event),
            onPointerMove: (PointerMoveEvent event) => setState(() {
                  _moveEvent = event;
                  _event = event;
                }),
            onPointerUp: (PointerUpEvent event) =>
                setState(() => _event = event),
          ),
          KuaiLePadding10Text("behavior属性:"),
          Padding10Text(
            "deferToChild:默认值属性，子widget会一个接一个的进行命中测试，如果子Widget中有测试通过的，则当前Widget通过，这就意味着，如果指针事件作用于子Widget上时，其父(祖先)Widget也肯定可以收到该事件\n",
            mycolor: _themeColor,
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300, 150)),
              child: Center(
                child: Text(
                  "只有点击文字才能切换主题颜色",
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onPointerDown: (event) {
              print("down A");
              setState(() {
                _themeColor =
                    _themeColor == Colors.blue ? Colors.orange : Colors.blue;
              });
            },
          ),
          Padding10Text(
              "opaque:在命中测试时，将当前Widget当成不透明处理(即使本身是透明的)，最终的效果相当于当前Widget的整个区域都是点击区域。举个例子：",
              mycolor: _themeColor),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300, 150)),
              child: Center(
                child: Text(
                  "behavior: HitTestBehavior.opaque\n整个区域点击都能切换主题颜色",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            behavior: HitTestBehavior.opaque,
            onPointerDown: (event) {
              print("down B");
              setState(() {
                _themeColor =
                    _themeColor == Colors.blue ? Colors.orange : Colors.blue;
              });
            },
          ),
          Padding10Text(
            "translucent：当点击Widget透明区域时，可以对自身边界内及底部可视区域都进行命中测试，这意味着点击顶部widget透明区域时，顶部widget和底部widget都可以接收到事件，例如：",
            mycolor: _themeColor,
          ),
          //TODO：这里实验了并没有达到效果，待研究
          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                ),
                onPointerDown: (event) => print("down1"),
                //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
              )
            ],
          ),
          KuaiLePadding10Text("忽略PointerEvent："),
          Padding10Text("假如我们不想让某个子树响应PointerEvent的话，我们可以使用IgnorePointer和AbsorbPointer，这两个Widget都能阻止子树接收指针事件，不同之处在于AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与，这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)，而IgnorePointer不可以。一个简单的例子如下："),
          Padding10Text("AbsorbPointer"),
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text("子Widge的点击事件:$_inValue\n"
                      "本身AbsorbPointer的点击事件：$_outValue",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                ),
                onPointerDown: (event)=>setState(()=>++_inValue),
              ),
            ),
            onPointerDown: (event)=>setState(()=>++_outValue),
          ),
          Padding10Text("IgnorePointer"),
          Listener(
            child: IgnorePointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text("子Widge的点击事件:$_inValue\n"
                      "本身IgnorePointer的点击事件：$_outValue",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),
                ),
                onPointerDown: (event)=>setState(()=>++_inValue),
              ),
            ),
            onPointerDown: (event)=>setState(()=>++_outValue),
          ),
        ]),
      ),
    );
  }
}
