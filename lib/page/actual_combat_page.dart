import 'package:flutter/material.dart';
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
            MyListTile(Colors.redAccent, 0, "新页面", NEW_PAGE, context),
            MyListTile(Colors.lightGreen, 1, "列表List", SHOPPING_PAGE, context),
            MyListTile(
                Colors.lightBlue, 2, "Widget状态管理三种方式", ECHO_PAGE, context),
            MyListTile(Colors.deepOrangeAccent, 3, "文本、字体样式", TEXT_STYLE_PAGE,
                context),
            MyListTile(Colors.indigoAccent, 5, "按钮", Button_PAGE, context),
            MyListTile(Colors.yellow, 6, "图片和Icon", IMAGE_ICON_PAGE, context),
            MyListTile(Colors.deepPurple, 7, "单选开关和复选框", SWITCH_CHECKBOX_PAGE,
                context),
            MyListTile(Colors.teal, 8, "输入框和表单", INPUTBOX_FORM_PAGE, context),
            MyListTile(Colors.cyanAccent, 9, "线性布局Row和Column", ROW_COLUMN_PAGE,
                context),
            MyListTile(
                Colors.purpleAccent, 10, "弹性布局Flex", FLEX_LAYOUT_PAGE, context),
            MyListTile(Colors.orangeAccent, 11, "流式布局Wrap、Flow", WRAP_FLOW_PAGE,
                context),
            MyListTile(Colors.redAccent, 12, "层叠布局Stack、Positioned",
                STACK_POSITIONED_PAGE, context),
            MyListTile(
                Colors.lightGreen, 13, "Padding的使用", PADDING_PAGE, context),
            MyListTile(Colors.lightBlue, 14, "布局限制类容器ConstrainedBox和SizedBox",
                CONSTRAINEDBOX_SIZEBOX_PAGE, context),
            MyListTile(Colors.deepOrangeAccent, 15, "装饰容器DecoratedBox",
                DECORATEBOX_PAGE, context),
            MyListTile(Colors.indigoAccent, 16, "变换Transform", TRANSFORM_PAGE,
                context),
            MyListTile(
                Colors.yellow, 17, "Container容器", CONTAINER_PAGE, context),
            MyListTile(Colors.deepPurple, 18, "Scaffold、TabBar、底部导航",
                SCAFFOLD_PAGE, context),
            MyListTile(
                Colors.teal, 19, "可滚动Widget简介", SCROLLABLE_PAGE, context),
            MyListTile(Colors.cyanAccent, 20, "SingleChildScrollView",
                SINGLECHILDSCROLLVIEW_PAGE, context),
            MyListTile(
                Colors.purpleAccent, 21, "ListView", LISTVIEW_PAGE, context),
            MyListTile(
                Colors.orangeAccent, 22, "GridView", GRIDVIEW_PAGE, context),
            MyListTile(Colors.redAccent, 23, "CustomeScrollView",
                CUSTOMSCROLLVIEW_PAGE, context),
            MyListTile(Colors.lightGreen, 24, "滚动监听及控制ScrollController",
                SCROLLCONSTROLLER_LISTENER_PAGE, context),
            MyListTile(Colors.lightBlue, 25, "导航返回拦截WillPopScope",
                WILLPOPSCOPE_PAGE, context),
            MyListTile(Colors.deepOrangeAccent, 26, "数据共享-InheritedWidget",
                INHERITED_PAGE, context),
            MyListTile(
                Colors.indigoAccent, 27, "主题-Theme", THEME_PAGE, context),
            MyListTile(
                Colors.yellow, 28, "原始指针事件处理", RAWPOINTEREVENT_PAGE, context),
            MyListTile(Colors.deepPurple, 29, "手势识别", GESTRUE_RECOGNITION_PAGE,
                context),
            MyListTile(Colors.teal, 30, "全局事件总线", EVENTBUS_PAGE, context),
            MyListTile(Colors.cyanAccent, 31, "通知notification",
                NOTIFICATION_PAGE, context),
            MyListTile(Colors.purpleAccent, 32, "Flutter动画简介",
                ANIMATION_TRODUCTION_PAGE, context),
            MyListTile(Colors.orangeAccent, 33, "动画结构",
                ANIMATION_STRUCTURE_PAGE, context),
            MyListTile(Colors.redAccent, 34, "自定义路由过渡动画", ROUTE_TRANSITION_ANIMATION_PAGE,
                context),
            MyListTile(Colors.lightGreen, 35, "Hero动画",
                HERO_ANIMATION_PAGE, context),
            MyListTile(Colors.lightBlue, 36, "交错动画",
                STRAGGERED_ANIMATION_PAGE, context),
            MyListTile(Colors.deepOrangeAccent, 37, "自定义Widget方法简介",
                CUSTOME_WIDGET_INTRODUCTION_PAGE, context),
            MyListTile(
                Colors.indigoAccent, 38, "通过组合自定义Widget", COMBINATION_WIDGET_PAGE, context),
            MyListTile(
                Colors.yellow, 39, "CustomPaint与Canvas", CUSTOMPAINT_CANVAS_PAGE, context),
            MyListTile(Colors.deepPurple, 40, "实例：圆形渐变进度条（自绘）", GRADIENT_CIRCLUAR_PROGRESS_PAGE,
                context),
            MyListTile(Colors.teal, 41, "文件操作", FILE_OPERATION_PAGE, context),
            MyListTile(Colors.cyanAccent, 42, "HTTP请求-HttpClient",
                HTTP_HTTPCLIENT_PAGE, context),
            MyListTile(Colors.purpleAccent, 43, "Http请求Dio框架",
                HTTP_DIO_PACKAGE_PAGE, context),
            MyListTile(Colors.orangeAccent, 33, "动画结构",
                ANIMATION_STRUCTURE_PAGE, context),
          ],
        ),
      ),
    );
  }
}

///自定义一些widget

class MyListTile extends ListTile {
  final Color backgroundColor;
  final int index;
  final String text;
  final String page_route;
  BuildContext context;

  MyListTile(this.backgroundColor, this.index, this.text, this.page_route,
      this.context)
      : super(
      leading: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Text(
          index.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(text),
      onTap: () {
        Navigator.pushNamed(context, page_route);
      });
}