import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_actual_combat/animation/AnimationIntroductionPage.dart';
import 'package:flutter_app/flutter_actual_combat/animation/AnimationStructurePage.dart';
import 'package:flutter_app/flutter_actual_combat/animation/HeroAnimationPage.dart';
import 'package:flutter_app/flutter_actual_combat/animation/RouteTransitionAnimationPage.dart';
import 'package:flutter_app/flutter_actual_combat/animation/StaggeredAnimationPage.dart';
import 'package:flutter_app/flutter_actual_combat/basis_widgets/ButtonPage.dart';
import 'package:flutter_app/flutter_actual_combat/basis_widgets/ImageAndIconPage.dart';
import 'package:flutter_app/flutter_actual_combat/basis_widgets/TextStylePage.dart';
import 'package:flutter_app/flutter_actual_combat/basis_widgets/updateWidget.dart';
import 'package:flutter_app/flutter_actual_combat/basis_widgets/SwitchAndCheckBoxPage.dart';
import 'package:flutter_app/flutter_actual_combat/basis_widgets/InputBoxAndFormPage.dart';
import 'package:flutter_app/flutter_actual_combat/container_widgets/ConstrainedAndSizeBoxPage.dart';
import 'package:flutter_app/flutter_actual_combat/container_widgets/ContainerPage.dart';
import 'package:flutter_app/flutter_actual_combat/container_widgets/DecoratedBoxPage.dart';
import 'package:flutter_app/flutter_actual_combat/container_widgets/MaterialWidgetPage.dart';
import 'package:flutter_app/flutter_actual_combat/container_widgets/PaddingPage.dart';
import 'package:flutter_app/flutter_actual_combat/container_widgets/TransformPage.dart';
import 'package:flutter_app/flutter_actual_combat/custom_widgets/CombinationWidgetPage.dart';
import 'package:flutter_app/flutter_actual_combat/custom_widgets/CustomPainCanvasPage.dart';
import 'package:flutter_app/flutter_actual_combat/custom_widgets/CustomWidgetMethodIntroductionPage.dart';
import 'package:flutter_app/flutter_actual_combat/custom_widgets/GradientCirclularProgressPage.dart';
import 'package:flutter_app/flutter_actual_combat/event_handing_notification/EventBustTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/event_handing_notification/GestrueRecognitionTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/event_handing_notification/NotificationTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/event_handing_notification/RawPointerEventPage.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/FileOperationPage.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/HttpDioPage.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/Http_HttpClientPaget.dart';
import 'package:flutter_app/flutter_actual_combat/functional_type_widgets/InheritedWidgetTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/functional_type_widgets/ThemeTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/functional_type_widgets/WillPopScopeTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/layout_widgets/FlexiblePage.dart';
import 'package:flutter_app/flutter_actual_combat/layout_widgets/RowAndColumnPage.dart';
import 'package:flutter_app/flutter_actual_combat/layout_widgets/StackAndPositionedPage.dart';
import 'package:flutter_app/flutter_actual_combat/layout_widgets/WrapAndFlowPage.dart';
import 'package:flutter_app/flutter_in_focus/1_first_flutter_widget.dart';
import 'package:flutter_app/flutter_in_focus/2_using_material_design.dart';
import 'package:flutter_app/flutter_widget_week/1_safe_area_widget.dart';
import 'package:flutter_app/flutter_widget_week/2_Expanded_widget.dart';
import 'package:flutter_app/flutter_widget_week/4_AnimatedContainer_widget.dart';
import 'package:flutter_app/flutter_widget_week/5_opacity_widget.dart';
import 'package:flutter_app/flutter_widget_week/6_FutureBuilder_widget.dart';
import 'package:flutter_app/page/index_page.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/CustomScrollViewTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/GridViewTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/ListViewTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/ScrollConstrollerListenerTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/ScrollableIntroductionPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/SingleChildScrollViewPage.dart';

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



///
const String FOCUS_FIRST_FLUTTER_WIDGET = "Focus_first_flutter_widget";
const String FOCUS_USING_MD_WIDGET = "Focus_Using_MD_widget";



///
const String WEEK_SAFEAREA_WIDGET = "Week_SafeArea_widget";
const String WEEK_EXPANDED_WIDGET = "Week_Expanded_widget";
const String WEEK_ANIMATEDCONTAINER_WIDGET = "Week_AnimatedContainer_widget";
const String WEEK_OPACITY_WIDGET = "Week_opacity_widget";
const String WEEK_FUTUREBUILDER_WIDGET = "Week_FutureBuilder_widget";







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
      ///
      FOCUS_FIRST_FLUTTER_WIDGET: (context) => Focus1FirstFlutterWidget(),
      FOCUS_USING_MD_WIDGET: (context) => FocusUsingMD(),
      ///
      WEEK_SAFEAREA_WIDGET: (context) => WeekSafeAreaWidgetPage(),
      WEEK_EXPANDED_WIDGET: (context) => WeekExpandedWidgetPage(),
      WEEK_ANIMATEDCONTAINER_WIDGET: (context) => WeekAnimatedContainerWidgetPage(),
      WEEK_OPACITY_WIDGET: (context) => WeekOpacityWidgetPage(),
      WEEK_FUTUREBUILDER_WIDGET: (context) => WeekFutureBuilderWidget(),

    },
    home: IndexPage(),
  ));
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

