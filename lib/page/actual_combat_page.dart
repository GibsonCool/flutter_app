import 'package:flutter/material.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_app/main.dart';

class ActualCombatPage extends StatefulWidget {
  @override
  _ActualCombatPageState createState() => _ActualCombatPageState();
}

class _ActualCombatPageState extends State<ActualCombatPage> {
  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}



class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("简单示例"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 0, top: 6, right: 6, bottom: 100),
        child: Column(
          children: <Widget>[
            MyListTile(Colors.redAccent, 0, "新页面", Routes.newPage, context),
            MyListTile(Colors.lightGreen, 1, "列表List", Routes.shoppingPage, context),
            MyListTile(
                Colors.lightBlue, 2, "Widget状态管理三种方式", Routes.echoPage, context,parmars: "来自Fluro传入的参数",),
            MyListTile(Colors.deepOrangeAccent, 3, "文本、字体样式", Routes.testStylePage,
                context),
            MyListTile(Colors.indigoAccent, 5, "按钮", Routes.buttonPage, context),
            MyListTile(Colors.yellow, 6, "图片和Icon", Routes.imageIconPage, context),
            MyListTile(Colors.deepPurple, 7, "单选开关和复选框", Routes.switchCheckBoxPage,
                context),
            MyListTile(Colors.teal, 8, "输入框和表单", Routes.inputBoxFormPage, context),
            MyListTile(Colors.cyanAccent, 9, "线性布局Row和Column", Routes.rowColumnPage,
                context),
            MyListTile(
                Colors.purpleAccent, 10, "弹性布局Flex", Routes.flexLayoutPage, context),
            MyListTile(Colors.orangeAccent, 11, "流式布局Wrap、Flow", Routes.wrapFlowPage,
                context),
            MyListTile(Colors.redAccent, 12, "层叠布局Stack、Positioned",
                Routes.stackPositionedPage, context),
            MyListTile(
                Colors.lightGreen, 13, "Padding的使用", Routes.paddingPage, context),
            MyListTile(Colors.lightBlue, 14, "布局限制类容器ConstrainedBox和SizedBox",
                Routes.constrainedBoxSizeBoxPage, context),
            MyListTile(Colors.deepOrangeAccent, 15, "装饰容器DecoratedBox",
                Routes.decorateBoxPage, context),
            MyListTile(Colors.indigoAccent, 16, "变换Transform", Routes.transformPage,
                context),
            MyListTile(
                Colors.yellow, 17, "Container容器", Routes.containerPage, context),
            MyListTile(Colors.deepPurple, 18, "Scaffold、TabBar、底部导航",
                Routes.scaffoldPage, context),
            MyListTile(
                Colors.teal, 19, "可滚动Widget简介", Routes.scrollablePage, context),
            MyListTile(Colors.cyanAccent, 20, "SingleChildScrollView",
                Routes.singleChildScrollviewPage, context),
            MyListTile(
                Colors.purpleAccent, 21, "ListView", Routes.listViewPage, context),
            MyListTile(
                Colors.orangeAccent, 22, "GridView", Routes.gridViewPage, context),
            MyListTile(Colors.redAccent, 23, "CustomeScrollView",
                Routes.customScrollviewPage, context),
            MyListTile(Colors.lightGreen, 24, "滚动监听及控制ScrollController",
                Routes.scrollstaticrollerListenerPage, context),
            MyListTile(Colors.lightBlue, 25, "导航返回拦截WillPopScope",
                Routes.willPopScope, context),
            MyListTile(Colors.deepOrangeAccent, 26, "数据共享-InheritedWidget",
                Routes.inheritedPage, context),
            MyListTile(
                Colors.indigoAccent, 27, "主题-Theme", Routes.themePage, context),
            MyListTile(
                Colors.yellow, 28, "原始指针事件处理", Routes.rawPointerEventPage, context),
            MyListTile(Colors.deepPurple, 29, "手势识别", Routes.gestrueRecognitionPage,
                context),
            MyListTile(Colors.teal, 30, "全局事件总线", Routes.eventBusPage, context),
            MyListTile(Colors.cyanAccent, 31, "通知notification",
                Routes.notificationPage, context),
            MyListTile(Colors.purpleAccent, 32, "Flutter动画简介",
                Routes.animationIntroductionPage, context),
            MyListTile(Colors.orangeAccent, 33, "动画结构",
                Routes.animationStructurePage, context),
            MyListTile(Colors.redAccent, 34, "自定义路由过渡动画", Routes.routeTransitionAnimationPage,
                context),
            MyListTile(Colors.lightGreen, 35, "Hero动画",
                Routes.heroAnimationPage, context),
            MyListTile(Colors.lightBlue, 36, "交错动画",
                Routes.straggeredAnimationPage, context),
            MyListTile(Colors.deepOrangeAccent, 37, "自定义Widget方法简介",
                Routes.customeWidgetIntroductionPage, context),
            MyListTile(
                Colors.indigoAccent, 38, "通过组合自定义Widget", Routes.combinationWidgetPage, context),
            MyListTile(
                Colors.yellow, 39, "CustomPaint与Canvas", Routes.customPaintCanvasPage, context),
            MyListTile(Colors.deepPurple, 40, "实例：圆形渐变进度条（自绘）", Routes.gradientCircluarProgressPage,
                context),
            MyListTile(Colors.teal, 41, "文件操作", Routes.fileOperationPage, context),
            MyListTile(Colors.cyanAccent, 42, "HTTP请求-HttpClient",
                Routes.httpClientPage, context),
            MyListTile(Colors.purpleAccent, 43, "Http请求Dio框架",
                Routes.httpDioPackagePage, context),
            MyListTile(Colors.orangeAccent, 44, "Element和BuildContext",
                Routes.elementBuildContextPage, context),
          ],
        ),
      ),
    );
  }
}

