import 'package:flutter/material.dart';

class SwitchAndCheckBoxPage extends StatefulWidget {
  @override
  _SwitchCheckBoxState createState() => _SwitchCheckBoxState();
}

class _SwitchCheckBoxState extends State<SwitchAndCheckBoxPage> {
  //单选开关状态
  bool _switchSelected = true;

  //复选框开关状态
  bool _checkBoxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("单选开关和复选框"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Checkbox(
                value: _checkBoxSelected,
                onChanged: (value) {
                  setState(() {
                    _checkBoxSelected = value;
                  });
                },
              ),
              Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                },
                activeColor: Colors.deepPurple,
              ),
              Checkbox(
                value: _checkBoxSelected,
                onChanged: (value) {
                  setState(() {
                    _checkBoxSelected = value;
                  });
                },
                activeColor: Colors.red,
              )
            ],
          ),
        ));
  }
}
