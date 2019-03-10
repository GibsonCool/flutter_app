import 'package:flutter/material.dart';

class InputBoxAndFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选开关和复选框"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "登录输入框:",
              style: TextStyle(color: Colors.red),
            ),
            TextField(
              ///是否自动获取焦点
              autofocus: true,

              /// 用于控制TextField的外观显示，如提示文本、背景颜色、边框等
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  )),
              onChanged: (value) {
                print("DoubleX---->userName:$value");
              },
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  )),
              onChanged: (value) => print("DoubleX---->userPwd:$value"),
            ),
            ControllerTestWidget(),
            FocusTestWidget(),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 5
                  )
                ),
                prefixIcon: Icon(Icons.person)
              ),

            )
          ],
        ),
      ),
    );
  }
}

/// Controller 方式
class ControllerTestWidget extends StatefulWidget {
  @override
  _ConstrollerTestWidgetState createState() => _ConstrollerTestWidgetState();
}

class _ConstrollerTestWidgetState extends State<ControllerTestWidget> {
  TextEditingController _unameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //初始化设置默认值，并且从特定位置开始选中后面的字符
    _unameController.text = "通过controller 初始化，设置默认选中，监听打印等~~";
    _unameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unameController.text.length);
    _unameController.addListener(() {
      print("controller：${_unameController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: _unameController,
    );
  }
}

/// 控制焦点
class FocusTestWidget extends StatefulWidget {
  @override
  _FocusTestWidgetState createState() => _FocusTestWidgetState();
}

class _FocusTestWidgetState extends State<FocusTestWidget> {
  ///焦点通过FocusScope来管理
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    focusNode1.addListener((){
      print("input1 是否获取到焦点：${focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(labelText: "input1"),
          ),
          TextField(
            autofocus: true,
            focusNode: focusNode2,
            decoration: InputDecoration(labelText: "input2"),
          ),
          RaisedButton(
            child: Text("移动焦点"),
            onPressed: (){
              ///设置focusNode2的输入框请求焦点
              if(null == focusScopeNode)
                focusScopeNode = FocusScope.of(context);
              focusScopeNode.requestFocus(focusNode2);
            },
          ),
          RaisedButton(
            child: Text("隐藏键盘"),
            onPressed: (){
              //请求失去焦点，键盘就会收起
              focusNode1.unfocus();
              focusNode2.unfocus();
            },
          )
        ],
      ),
    );
  }
}
