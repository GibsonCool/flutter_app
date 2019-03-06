import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/animation/AnimationIntroductionPage.dart';
import 'package:flutter_app/animation/AnimationStructurePage.dart';
import 'package:flutter_app/animation/HeroAnimationPage.dart';
import 'package:flutter_app/animation/RouteTransitionAnimationPage.dart';
import 'package:flutter_app/animation/StaggeredAnimationPage.dart';
import 'package:flutter_app/basis_widgets/ButtonPage.dart';
import 'package:flutter_app/basis_widgets/ImageAndIconPage.dart';
import 'package:flutter_app/basis_widgets/TextStylePage.dart';
import 'package:flutter_app/basis_widgets/ShoppingListPage.dart';
import 'package:flutter_app/basis_widgets/updateWidget.dart';
import 'package:flutter_app/basis_widgets/SwitchAndCheckBoxPage.dart';
import 'package:flutter_app/basis_widgets/InputBoxAndFormPage.dart';
import 'package:flutter_app/container_widgets/ConstrainedAndSizeBoxPage.dart';
import 'package:flutter_app/container_widgets/ContainerPage.dart';
import 'package:flutter_app/container_widgets/DecoratedBoxPage.dart';
import 'package:flutter_app/container_widgets/MaterialWidgetPage.dart';
import 'package:flutter_app/container_widgets/PaddingPage.dart';
import 'package:flutter_app/container_widgets/TransformPage.dart';
import 'package:flutter_app/custom_widgets/CombinationWidgetPage.dart';
import 'package:flutter_app/custom_widgets/CustomPainCanvasPage.dart';
import 'package:flutter_app/custom_widgets/CustomWidgetMethodIntroductionPage.dart';
import 'package:flutter_app/custom_widgets/GradientCirclularProgressPage.dart';
import 'package:flutter_app/event_handing_notification/EventBustTestPage.dart';
import 'package:flutter_app/event_handing_notification/GestrueRecognitionTestPage.dart';
import 'package:flutter_app/event_handing_notification/NotificationTestPage.dart';
import 'package:flutter_app/event_handing_notification/RawPointerEventPage.dart';
import 'package:flutter_app/file_and_network/FileOperationPage.dart';
import 'package:flutter_app/file_and_network/HttpDioPage.dart';
import 'package:flutter_app/file_and_network/Http_HttpClientPaget.dart';
import 'package:flutter_app/functional_type_widgets/InheritedWidgetTestPage.dart';
import 'package:flutter_app/functional_type_widgets/ThemeTestPage.dart';
import 'package:flutter_app/functional_type_widgets/WillPopScopeTestPage.dart';
import 'package:flutter_app/layout_widgets/FlexiblePage.dart';
import 'package:flutter_app/layout_widgets/RowAndColumnPage.dart';
import 'package:flutter_app/layout_widgets/StackAndPositionedPage.dart';
import 'package:flutter_app/layout_widgets/WrapAndFlowPage.dart';
import 'package:flutter_app/scrollable_widgets/CustomScrollViewTestPage.dart';
import 'package:flutter_app/scrollable_widgets/GridViewTestPage.dart';
import 'package:flutter_app/scrollable_widgets/ListViewTestPage.dart';
import 'package:flutter_app/scrollable_widgets/ScrollConstrollerListenerTestPage.dart';
import 'package:flutter_app/scrollable_widgets/ScrollableIntroductionPage.dart';
import 'package:flutter_app/scrollable_widgets/SingleChildScrollViewPage.dart';

const String NEW_PAGE = "new_page";
const String SHOPPING_PAGE = "shopping_page";
const String ECHO_PAGE = "echo_page";
const String TEXT_STYLE_PAGE = "Text_Style_page";
const String Button_PAGE = "Button_page";
const String IMAGE_ICON_PAGE = "Image_Icon_page";
const String SWITCH_CHECKBOX_PAGE = "Switch_CheckBox_page";
const String INPUTBOX_FORM_PAGE = "InputBox_Form_page";
const String ROW_COLUMN_PAGE = "Row_Column_page";
const String FLEX_LAYOUT_PAGE = "Flex_Layout_page";
const String WRAP_FLOW_PAGE = "Wrap_Flow_page";
const String STACK_POSITIONED_PAGE = "Stack_Positioned_page";
const String PADDING_PAGE = "Padding_page";
const String CONSTRAINEDBOX_SIZEBOX_PAGE = "ConstrainedBox_SizeBox_page";
const String DECORATEBOX_PAGE = "DecorateBox_page";
const String TRANSFORM_PAGE = "Transform_page";
const String CONTAINER_PAGE = "Container_page";
const String SCAFFOLD_PAGE = "Scaffold_page";
const String SCROLLABLE_PAGE = "Scrollable_page";
const String SINGLECHILDSCROLLVIEW_PAGE = "SingleChildScrollview_page";
const String LISTVIEW_PAGE = "ListView_page";
const String GRIDVIEW_PAGE = "GridView_page";
const String CUSTOMSCROLLVIEW_PAGE = "CustomScrollView_page";
const String SCROLLCONSTROLLER_LISTENER_PAGE =
    "ScrollConstroller_Listener_page";
const String WILLPOPSCOPE_PAGE = "WillPopScope_page";
const String INHERITED_PAGE = "Inherited_page";
const String THEME_PAGE = "Theme_page";
const String RAWPOINTEREVENT_PAGE = "RawPointerEvent_page";
const String GESTRUE_RECOGNITION_PAGE = "Gestrue_Recognition_page";
const String EVENTBUS_PAGE = "EventBus_page";
const String NOTIFICATION_PAGE = "Notification_page";
const String ANIMATION_TRODUCTION_PAGE = "Animation_troduction_page";
const String ANIMATION_STRUCTURE_PAGE = "Animation_Structure_page";
const String ROUTE_TRANSITION_ANIMATION_PAGE = "Route_Transition_Animation_page";
const String HERO_ANIMATION_PAGE = "Hero_Animation_page";
const String STRAGGERED_ANIMATION_PAGE = "Straggered_Animation_page";
const String CUSTOME_WIDGET_INTRODUCTION_PAGE = "Custome_widget_introduction_page";
const String COMBINATION_WIDGET_PAGE = "Combination_widget_page";
const String CUSTOMPAINT_CANVAS_PAGE = "CustomPaint_canvas_page";
const String GRADIENT_CIRCLUAR_PROGRESS_PAGE = "Gradient_Circluar_Progress_page";
const String FILE_OPERATION_PAGE = "File_operation_page";
const String HTTP_HTTPCLIENT_PAGE = "Http_HttpClient_page";
const String HTTP_DIO_PACKAGE_PAGE = "Http_Dio_Package_page";

void main() {
  runApp(new MaterialApp(
    localizationsDelegates: [
      //
//      GlobalMa
    ],
    title: "List购物清单教程",
    //注册路由表
    routes: {
      NEW_PAGE: (context) => NewRoute(),
//      SHOPPING_PAGE: (context) => ShoppingLisIndexedStackt(),
      //使用命名参数路由，参数固定了无法动态修改
      ECHO_PAGE: (context) => PrintRoute("固定内容"),
      TEXT_STYLE_PAGE: (context) => TextStyleRoute(),
      Button_PAGE: (context) => ButtonPage(),
      IMAGE_ICON_PAGE: (context) => ImageAndIconPage(),
      SWITCH_CHECKBOX_PAGE: (context) => SwitchAndCheckBoxPage(),
      INPUTBOX_FORM_PAGE: (context) => InputBoxAndFormPage(),
      ROW_COLUMN_PAGE: (context) => RowAndColumnPage(),
      FLEX_LAYOUT_PAGE: (context) => FlexiblePage(),
      WRAP_FLOW_PAGE: (context) => WrapAndFlowPage(),
      STACK_POSITIONED_PAGE: (context) => StackAndPositionedPage(),
      PADDING_PAGE: (context) => PaddingPage(),
      CONSTRAINEDBOX_SIZEBOX_PAGE: (context) => ConstrainedAndSizePage(),
      DECORATEBOX_PAGE: (context) => DecorateBoxPage(),
      TRANSFORM_PAGE: (context) => TransformPage(),
      CONTAINER_PAGE: (context) => ContainerPage(),
      SCAFFOLD_PAGE: (context) => ScaffoldRoutePage(),
      SCROLLABLE_PAGE: (context) => ScrollableIntroductionPage(),
      SINGLECHILDSCROLLVIEW_PAGE: (context) => SingleChildScrollViewTestPage(),
      LISTVIEW_PAGE: (context) => ListViewTestPage(),
      GRIDVIEW_PAGE: (context) => GridViewTestPage(),
      CUSTOMSCROLLVIEW_PAGE: (context) => CustomScrollViewTestPage(),
      SCROLLCONSTROLLER_LISTENER_PAGE: (context) =>
          ScrollConstrollerListenerTestPage(),
      WILLPOPSCOPE_PAGE: (context) => WillPopScopeTestPage(),
      INHERITED_PAGE: (context) => InheritedWidgetTestPage(),
      THEME_PAGE: (context) => ThemeTestPage(),
      RAWPOINTEREVENT_PAGE: (context) => RawPointerEventPage(),
      GESTRUE_RECOGNITION_PAGE: (context) => GestrueRecognitionTestPage(),
      EVENTBUS_PAGE: (context) => EventBusTestPage(),
      NOTIFICATION_PAGE: (context) => NotificationTestPage(),
      ANIMATION_TRODUCTION_PAGE: (context) => AnimationIntroductionPage(),
      ANIMATION_STRUCTURE_PAGE: (context) => AnimationStructurePage(),
      ROUTE_TRANSITION_ANIMATION_PAGE: (context) => RouteTransitionAnimationPage(),
      HERO_ANIMATION_PAGE: (context) => HeroAnimationPage(),
      STRAGGERED_ANIMATION_PAGE: (context) => StaggeredAnimationPage(),
      CUSTOME_WIDGET_INTRODUCTION_PAGE: (context) => CustomWidgetMethodIntroductionPage(),
      COMBINATION_WIDGET_PAGE: (context) => CombinationWidgetPage(),
      CUSTOMPAINT_CANVAS_PAGE: (context) => CustomPainCanvasPage(),
      GRADIENT_CIRCLUAR_PROGRESS_PAGE: (context) => GradientCircularProgressPage(),
      FILE_OPERATION_PAGE: (context) => FileOperationPage(),
      HTTP_HTTPCLIENT_PAGE: (context) => Http_HttpClientPage(),
      HTTP_DIO_PACKAGE_PAGE: (context) => HttpDioPage(),
    },
    home: HomeBody(),
  ));
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
  Height200SizeBox({Widget childWidget,double height:200})
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
