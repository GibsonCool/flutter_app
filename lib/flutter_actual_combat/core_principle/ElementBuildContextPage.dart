import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ElementBuildContextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Element和BuildContext"),
      ),
      body: ScrollBarColumBody([
        Text('通过纯粹的Element 模拟一个StatefulWidget的功能，实现一个按钮，每点击一次就对其数字随便排序一次'),
        CustomeHome(),
      ]),
    );
  }
}

//通过纯粹的Element来模拟一个StatefulWidget 的功能
class HomeView extends ComponentElement {
  String text = '123456789';

  HomeView(Widget widget) : super(widget);

  @override
  Widget build() {
    // Theme.of(this)  这里使用this 而不是使用context 因为其实element就是BuildContext的实现类
    Color primary = Theme.of(this).primaryColor;
    return GestureDetector(
      child: Center(
        child: FlatButton(
            onPressed: () {
              var t = text.split('')..shuffle();
              text = t.join();
              //点击后将该element 标记为dirty。element将会rebuild。
              //其实在StatefulWidget 中调用setState()最终也是调用element的markNeedsBuild方法
              markNeedsBuild();
            },
            child: Text(
              text,
              style: TextStyle(color: primary),
            )),
      ),
    );
  }
}

class CustomeHome extends Widget{
  @override
  Element createElement() => HomeView(this);

}