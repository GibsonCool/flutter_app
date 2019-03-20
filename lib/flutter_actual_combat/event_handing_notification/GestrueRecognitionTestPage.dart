import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class GestrueRecognitionTestPage extends StatefulWidget {
  @override
  _GestrueRecognitionTestPageState createState() =>
      _GestrueRecognitionTestPageState();
}

class _GestrueRecognitionTestPageState
    extends State<GestrueRecognitionTestPage> {
  String _operation = "当前没有事件"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("GestureDetector:"),
        Padding10Text("GestureDetector是一个用于手势识别的功能性Widget，我们通过它可以来识别各种手势，"
            "它是指针事件的语义化封装，在Container识别并显示各种事件名（点击、双击、长按）"),
        Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200,
              height: 150,
              child: Text(
                _operation,
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => _updateText("点击"),
            onDoubleTap: () => _updateText("双击"),
            onLongPress: () => _updateText("长按"),
          ),
        ),
        Text(
          "注意:当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时，这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等一断时间来确定是否为双击事件。如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。\n",
          style: TextStyle(color: Colors.red),
        ),
        KuaiLePadding10Text("拖动和滑动:"),
        Padding10Text(
            "DragDownDetails.globalPosition：当用户按下时，此属性为用户按下的位置相对于屏幕(而非父widget)原点(左上角)的偏移。\n"
            "DragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量。\n"
            "DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），示例中并没有处理手指抬起时的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画。\n"),
        RaisedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => _Drag())),
          child: Text("查看示例"),
        ),
        KuaiLePadding10Text("单一方向拖动:"),
        Padding10Text(
            "在很多场景，我们只需要沿一个方向来拖动，如一个垂直方向的列表，GestureDetector可以只识别特定方向的手势事件"),
        RaisedButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => _SingleDirection())),
          child: Text("查看示例"),
        ),
        KuaiLePadding10Text("缩放："),
        Padding10Text("GestureDetector还可以监听缩放事件"),
        RaisedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => _ScaleImg())),
          child: Text("查看示例"),
        ),
        KuaiLePadding10Text("GestureRecognizer:"),
        Padding10Text(
            "GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势，GestureDetector直接可以接收一个子Widget。GestureRecognizer是一个抽象类，一种手势的识别器对应一个GestureRecognizer的子类，Flutter实现了丰富的手势识别器，我们可以直接使用"),
        _GestureRecogonizerPage(),
        KuaiLePadding10Text("手势竞争:"),
        Padding10Text("如果同时监听水平和垂直方向的拖动事件，就会产生手势竞争，第一次移动时两个轴上的位移分量大的一方在竞争中胜出。"),
        RaisedButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => BothDirectionTestPage())),
          child: Text("查看示例"),
        ),
        KuaiLePadding10Text("手势冲突:"),
        Padding10Text(
            "由于手势竞争最终只有一个胜出者，所以，当有多个手势识别器时，可能会产生冲突。假设有一个widget，它可以左右拖动，现在我们也想检测在它上面手指按下和抬起的事件"),
        RaisedButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => GestureConflictPage())),
          child: Text("查看示例"),
        ),
      ]),
    );
  }

  void _updateText(String value) {
    setState(() {
      _operation = value;
    });
  }
}

/// 可拖动的原型字母Widget
class _Drag extends StatefulWidget {
  @override
  __DragState createState() => __DragState();
}

class __DragState extends State<_Drag> {
  //记录距离顶部和左边的偏移量
  double _top = 400;
  double _left = 160;
  String _str = "";
  String _speed = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动（任意方向）"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 3,
            top: 10,
            child: Padding10Text("手指按下的位置相对于屏幕偏移：$_str"),
          ),
          Positioned(
            left: 3,
            top: 35,
            child: Padding10Text("滑动速度(包含x、y两个轴的）：$_speed"),
          ),
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                radius: 25,
                child: Text(
                  "拖我~",
                  textScaleFactor: 0.7,
                ),
              ),
              //手指按下的回调
              onPanDown: (e) =>
                  setState(() => _str = e.globalPosition.toString()),
              //手指滑动触发的回调
              onPanUpdate: (DragUpdateDetails e) {
                //计算手指滑时的偏移量，重建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (e) => setState(() => _speed = e.velocity.toString()),
            ),
          )
        ],
      ),
    );
  }
}

///单一方向拖动
class _SingleDirection extends StatefulWidget {
  @override
  __SingleDirectionState createState() => __SingleDirectionState();
}

class __SingleDirectionState extends State<_SingleDirection> {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单一方向拖动"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red[100],
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 3,
                    top: 10,
                    child: Padding10Text("垂直方向拖动："),
                  ),
                  Positioned(
                    top: _top,
                    child: GestureDetector(
                      child: CircleAvatar(
                        child: Text("A"),
                      ),
                      onVerticalDragUpdate: (e) =>
                          setState(() => _top += e.delta.dy),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue[100],
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 3,
                    top: 10,
                    child: Padding10Text("水平方向拖动："),
                  ),
                  Positioned(
                    left: _left,
                    child: GestureDetector(
                      child: CircleAvatar(
                        child: Text("B"),
                      ),
                      onHorizontalDragUpdate: (e) =>
                          setState(() => _left += e.delta.dx),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///缩放
class _ScaleImg extends StatefulWidget {
  @override
  __ScaleImgState createState() => __ScaleImgState();
}

class __ScaleImgState extends State<_ScaleImg> {
  double _width = 200; //通过修改图片宽度来达到缩放的效果
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片缩放"),
      ),
      body: Center(
        child: GestureDetector(
          child: Image.asset(
            "images/test.jpg",
            width: _width,
          ),
          //缩放倍数在0.8到10倍之间
          onScaleUpdate: (e) =>
              setState(() => _width = 200 * e.scale.clamp(.8, 10)),
        ),
      ),
    );
  }
}

///GestureRecognizer
class _GestureRecogonizerPage extends StatefulWidget {
  @override
  __GestureRecogonizerPageState createState() =>
      __GestureRecogonizerPageState();
}

class __GestureRecogonizerPageState extends State<_GestureRecogonizerPage> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  Color _changeColorValue = Colors.blue;
  int intValue = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(children: [
          TextSpan(text: "前面都是浮云"),
          TextSpan(
            text: "点我变色",
            style: TextStyle(
              fontSize: 25,
              color: _changeColorValue,
            ),
            recognizer: _tapGestureRecognizer
              //这里用了个级联操作符
              ..onTap = () {
                setState(() => _changeColorValue =
                    _changeColorValue == Colors.blue[intValue]
                        ? Colors.red[intValue]
                        : Colors.blue[intValue]);
              },
          ),
          TextSpan(text: "后面都是追兵"),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
}

///手势竞争
class BothDirectionTestPage extends StatefulWidget {
  @override
  _BothDirectionTestPageState createState() => _BothDirectionTestPageState();
}

class _BothDirectionTestPageState extends State<BothDirectionTestPage> {
  double _top = 0;

  double _left = 0;

  double _dx = 0;
  double _dy = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势竞争"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 250,
            left: 10,
            child: KuaiLePadding10Text(
                "当垂直和水平方向都有监听时，\n偏移量大的一方胜出可以处理事件\n垂直方向的位移分量:$_dy\n水平方向的位移分量:$_dx"),
          ),
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                radius: 30,
                child: Text("A"),
              ),
              onVerticalDragUpdate: (e) => setState(() {
                    _dy = e.delta.dy;
                    _dx = e.delta.dx;
                    _top += e.delta.dy;
                  }),
              onHorizontalDragUpdate: (e) => setState(() {
                    _dy = e.delta.dy;
                    _dx = e.delta.dx;
                    _left += e.delta.dx;
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

///手势冲突
class GestureConflictPage extends StatefulWidget {
  @override
  _GestureConflictPageState createState() => _GestureConflictPageState();
}

class _GestureConflictPageState extends State<GestureConflictPage> {
  double _left = 0;
  String _downInfo = "";
  String _upInfo = "";
  String _dragUpdate = "";
  String _dragEnd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势冲突"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 8),
              width: double.infinity,
              color: Colors.red[100],
              child: Text("Down:$_downInfo\n"
                  "Up:$_upInfo\n"
                  "onHorizontalDragUpdate:$_dragUpdate\n"
                  "onHorizontalDragEnd:$_dragEnd"),
            ),
          ),
          Expanded(
            flex: 9,
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.orange[100],
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 30,
                          child: Text("有冲突,up事件无法接收"),
                        ),
                        Positioned(
                          left: _left,
                          child: GestureDetector(
                            child: CircleAvatar(
                              child: Text("A"),
                            ),
                            onHorizontalDragUpdate: (e) => setState(() {
                                  _dragUpdate = e.delta.toString();
                                  _left += e.delta.dx;
                                }),
                            onHorizontalDragEnd: (e) {
                              _dragEnd = e.velocity.toString();
                            },
                            onTapDown: (e) {
                              _downInfo = e.globalPosition.toString();
                            },
                            onTapUp: (e) {
                              _upInfo = e.globalPosition.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue[100],
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 30,
                          child: Text("通过Listener识别原始\n指针事件解决冲突\nup事件有响应"),
                        ),
                        Positioned(
                          left: _left,
                          child: Listener(
                            onPointerDown: (e) =>setState(()=>_downInfo = e.position.toString()),
                            onPointerUp: (e) => setState(()=>_upInfo = e.position.toString()),
                            child: GestureDetector(
                              child: CircleAvatar(
                                radius: 25,
                                child: Text("B"),
                              ),
                              onHorizontalDragUpdate: (e) => setState(() {
                                    _left += e.delta.dx;
                                    _dragUpdate = e.globalPosition.toString();
                                  }),
                              onHorizontalDragEnd: (e) =>setState(()=>_dragEnd = e.velocity.toString()),
                            ),
                          ),
                        )
                      ],
                    ),
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
