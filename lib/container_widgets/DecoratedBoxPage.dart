import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class DecorateBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("装饰容器DecoratedBox"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            KuaiLePadding10Text(
                "DecoratedBox可以在其子widget绘制前(或后)绘制一个装饰Decoration（如背景、边框、渐变等）"),
            Padding10Text(
                "decoration：代表将要绘制的装饰，它类型为Decoration，Decoration是一个抽象类，它定义了一个接口 createBoxPainter()，子类的主要职责是需要通过实现它来创建一个画笔，该画笔用于绘制装饰。"),
            Padding10Text(
                "position：此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，该枚举类两个值："),
            Text("    -->background：在子widget之后绘制，即背景装饰。"),
            Text("    -->foreground：在子widget之上绘制，即前景。"),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange[700]]), //背景色水平方向渐变
                borderRadius: BorderRadius.circular(3), //3元素圆角
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                child: Text("Login"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange[700]]), //背景色水平方向渐变
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 10),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                child: Text(
                  "send",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200),
            )
          ],
        ),
      ),
    );
  }
}
