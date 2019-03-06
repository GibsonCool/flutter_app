import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ConstrainedAndSizePage extends StatelessWidget {
  Widget redBox = Container(
    height: 10,
    width: 10,
    child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBox和SizedBox"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            KuaiLePadding10Text("固定大小宽高都是10像素的widget(redBox):"),
            redBox,
            Padding10Text("将redBox放到ConstrainedBox中限制最小高度为50,宽度填充满:"),
            ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: 50, minWidth: double.infinity),
                child: redBox),
            Padding10Text("BoxConstraints.tight(Size(100,100):"),
            ConstrainedBox(
                constraints: BoxConstraints.tight(Size(100, 100)),
                child: redBox),
            Padding10Text("BoxConstraints.loose(Size(100,100):"),
            ConstrainedBox(
                constraints: BoxConstraints.loose(Size(100, 100)),
                child: redBox),
            Padding10Text("BoxConstraints.expand(height: 30,width: 200):"),
            ConstrainedBox(
                constraints: BoxConstraints.expand(height: 30, width: 200),
                child: redBox),
            Padding10Text("BoxConstraints.tightFor(height: 30,width: 200):"),
            ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 30, width: 200),
                child: redBox),
            KuaiLePadding10Text("SizedBox:"),
            Padding10Text("SizedBox用于给子widget指定固定的宽高,如限定宽高80:"),
            SizedBox(
              width: 80,
              height: 80,
              child: redBox,
            ),
            KuaiLePadding10Text("多重限制，当一个widget有多个父ConstrainedBox限制:"),
            Padding10Text(
                "父（minWidth: 60, minHeight: 60） 子(minWidth: 90, minHeight: 20)"),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60, minHeight: 60),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90, minHeight: 20),
                child: redBox,
              ),
            ),
            Padding10Text(
                "父(minWidth: 90, minHeight: 20) 子(minWidth: 60, minHeight: 60)"),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90, minHeight: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60, minHeight: 60),
                child: redBox,
              ),
            ),
            Text(
              "对于minWidth和minHeight来说，是取父子中相应数值较大的",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            Padding10Text(
                "父（maxWidth: 60, maxHeight: 60） 子(maxWidth: 90, maxHeight: 20)"),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 60, maxHeight: 60),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 90, maxHeight: 20),
                child: redBox,
              ),
            ),
            Padding10Text(
                "父(maxWidth: 90, maxHeight: 20) 子(maxWidth: 60, maxHeight: 60)"),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 90, maxHeight: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 60, maxHeight: 60),
                child: redBox,
              ),
            ),
            Text(
              "对于maxWidth和maxHeight来说，都不生效保持原大小",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            KuaiLePadding10Text("UnconstrainedBox允许子Widget按照本身大小去绘制,'去除'多重限制的效果:"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("原效果:"),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60, minHeight: 60),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 90, minHeight: 20),
                      child: redBox,
                    ),
                ),
                Text("   '去除'父限制:"),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60, minHeight: 60),
                  child: UnconstrainedBox(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 90, minHeight: 20),
                      child: redBox,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "UnconstrainedBox对父限制的“去除”并非是真正的去除,上面例子中虽然红色区域大小是90×20，"
                  "但上下仍然有20的空白空间，说明父限制minheight:60是生效的，"
                  "只是不影响子元素的大小，但仍然占有相应空间。",
            ),
            Text(
              "结论：父ConstrainedBox是作用于子ConstrainedBox上，而redBox只受子ConstrainedBox限制",
              textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.red,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
          ],
        ),
      ),
    );
  }
}
