import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() {
  final router = Router();
  Routes.configureRoutes(router);
  runApp(new MaterialApp(
    localizationsDelegates: [
      //
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', 'US'), //美国英语
      const Locale('zh', 'CN'), //中文简体
    ],
    title: "flutter 学习总结",
    onGenerateRoute: Routes.router.generator,
  ));
}

///自定义一些widget

class MyListTile extends ListTile {
  final Color backgroundColor;
  final int index;
  final String text;
  final String page_route;
  final String parmars;
  BuildContext context;

  MyListTile(this.backgroundColor, this.index, this.text, this.page_route,
      this.context,{this.parmars=''})
      :super(
            leading: CircleAvatar(
              backgroundColor: backgroundColor,
              child: Text(
                index.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(text),
            onTap: () {
//              Navigator.pushNamed(context, page_route);
                var json = jsonEncode(Utf8Encoder().convert(parmars));
                Routes.router.navigateTo(context, '$page_route?message=$json',transition: TransitionType.inFromRight);
            });
}

class KuaiLeText extends Text {
  KuaiLeText(String data)
      : super(data,
            textScaleFactor: 1.2, style: TextStyle(fontFamily: 'KuaiLe'));
}

class Padding10Text extends Padding {
  final String data;
  final Color mycolor;

  Padding10Text(this.data, {this.mycolor = Colors.black})
      : super(
            padding: EdgeInsets.all(10),
            child: Text(
              data,
              style: TextStyle(color: mycolor),
            ));
}

class KuaiLePadding10Text extends Padding {
  final String data;
  final Color mycolor;

  //字体大小设置为可选参数，默认是1.2
  KuaiLePadding10Text(this.data,
      {double textScaleFactor = 1.2, this.mycolor = Colors.black})
      : super(
            padding: EdgeInsets.all(10),
            child: Text(
              data,
              textScaleFactor: textScaleFactor,
              style: TextStyle(fontFamily: 'KuaiLe', color: mycolor),
            ));
}

/* 股东200像素高度 */
class Height200SizeBox extends SizedBox {
  Height200SizeBox({Widget childWidget, double height: 200})
      : super(
          height: height,
          child: CupertinoScrollbar(
            child: childWidget,
          ),
        );
}

class ScrollBarColumBody extends Scrollbar {
  final List<Widget> childrenList;

  ScrollBarColumBody(this.childrenList)
      : super(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 16, right: 16, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: childrenList,
              ),
            ),
          ),
        );
}

///带路由跳转的按钮
class MaterialPageRouteButton extends StatelessWidget {
  final Widget child;
  final String title;

  const MaterialPageRouteButton({@required routeChild, @required title})
      : child = routeChild,
        title = title;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return child;
        }));
      },
      child: Text(title),
    );
  }
}

class IOSPageRouteButton extends StatelessWidget {
  final Widget child;
  final String title;

  const IOSPageRouteButton({@required routeChild, @required title})
      : child = routeChild,
        title = title;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return child;
        }));
      },
      child: Text(title),
    );
  }
}
