import 'package:fluro/fluro.dart';
import 'package:flutter_app/flutter_actual_combat/basis_widgets/ShoppingListPage.dart';
import 'package:flutter_app/flutter_actual_combat/container_widgets/ConstrainedAndSizeBoxPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/ScrollConstrollerListenerTestPage.dart';
import 'package:flutter_app/page/index_page.dart';


import 'package:flutter_app/flutter_widget_week/9_page_view_widget.dart';
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
import 'package:flutter_app/flutter_widget_week/7_fade_transition.dart';
import 'package:flutter_app/flutter_widget_week/8_floating_action_button.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/CustomScrollViewTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/GridViewTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/ListViewTestPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/ScrollableIntroductionPage.dart';
import 'package:flutter_app/flutter_actual_combat/scrollable_widgets/SingleChildScrollViewPage.dart';

class Routes {
  static Router router;

  //首页  一定要使用'/'配置
  static String homePage = '/';

  //实战相关页面
  static String actualCombatPage = '/actual_combat_page';
  static String shoppingPage = '/shopping_page';
  static String newPage = '/actual_new_page';
  static String echoPage = "echo_page";
  static String testStylePage = "Text_Style_page";
  static String buttonPage = "Button_page";
  static String imageIconPage = "Image_Icon_page";
  static String switchCheckBoxPage = "Switch_CheckBox_page";
  static String inputBoxFormPage = "InputBox_Form_page";
  static String rowColumnPage = "Row_Column_page";
  static String flexLayoutPage = "Flex_Layout_page";
  static String wrapFlowPage = "Wrap_Flow_page";
  static String stackPositionedPage = "Stack_Positioned_page";
  static String paddingPage = "Padding_page";
  static String constrainedBoxSizeBoxPage = "ConstrainedBox_SizeBox_page";
  static String decorateBoxPage = "DecorateBox_page";
  static String transformPage = "Transform_page";
  static String containerPage = "Container_page";
  static String scaffoldPage = "Scaffold_page";
  static String scrollablePage = "Scrollable_page";
  static String singleChildScrollviewPage = "SingleChildScrollview_page";
  static String listViewPage = "ListView_page";
  static String gridViewPage = "GridView_page";
  static String customScrollviewPage = "CustomScrollView_page";
  static String scrollstaticrollerListenerPage =
      "Scrollstaticroller_Listener_page";
  static String willPopScope = "WillPopScope_page";
  static String inheritedPage = "Inherited_page";
  static String themePage = "Theme_page";
  static String rawPointerEventPage = "RawPointerEvent_page";
  static String gestrueRecognitionPage = "Gestrue_Recognition_page";
  static String eventBusPage = "EventBus_page";
  static String notificationPage = "Notification_page";
  static String animationIntroductionPage = "Animation_troduction_page";
  static String animationStructurePage = "Animation_Structure_page";
  static String routeTransitionAnimationPage =
      "Route_Transition_Animation_page";
  static String heroAnimationPage = "Hero_Animation_page";
  static String straggeredAnimationPage = "Straggered_Animation_page";
  static String customeWidgetIntroductionPage =
      "Custome_widget_introduction_page";
  static String combinationWidgetPage = "Combination_widget_page";
  static String customPaintCanvasPage = "CustomPaint_canvas_page";
  static String gradientCircluarProgressPage =
      "Gradient_Circluar_Progress_page";
  static String fileOperationPage = "File_operation_page";
  static String httpClientPage = "Http_HttpClient_page";
  static String httpDioPackagePage = "Http_Dio_Package_page";

  //
  static String focusFirstFlutterPage = "Focus_first_flutter_widget";
  static String focusUsingMDPage = "Focus_Using_MD_widget";

  //每周小部件
  static String weekSafeAreaPage = "Week_SafeArea_widget";
  static String weekExpandedPage = "Week_Expanded_widget";
  static String weekAnimatedContainerPage = "Week_AnimatedContainer_widget";
  static String weekOpacityPage = "Week_opacity_widget";
  static String weekFutureBuilderPage = "Week_FutureBuilder_widget";
  static String weekFadeTransitionPage = "Week_FadeTransition_widget";
  static String weekFABPage = "Week_FAB_widget";
  static String weekPageViewPage = "Week_PageView_widget";

  static void configureRoutes(Router router) {
    ///router.define的作用相当于注册页面，routePath:要跳转的链接    handler:用来获取传参和创建界面
    router.define(homePage,
        handler: Handler(handlerFunc: (_, __) => IndexPage()));

    router.define(newPage,
        handler: Handler(handlerFunc: (_, __) => NewRoute()));
    router.define(shoppingPage,
        handler: Handler(handlerFunc: (_, __) => ShoppingList()));
    router.define(echoPage,
        handler: Handler(
            handlerFunc: (_, params) => PrintRoute(params['message']?.first)));
    router.define(testStylePage,
        handler: Handler(handlerFunc: (_, __) => TextStyleRoute()));
    router.define(buttonPage,
        handler: Handler(handlerFunc: (_, __) => ButtonPage()));
    router.define(imageIconPage,
        handler: Handler(handlerFunc: (_, __) => ImageAndIconPage()));
    router.define(switchCheckBoxPage,
        handler: Handler(handlerFunc: (_, __) => SwitchAndCheckBoxPage()));
    router.define(inputBoxFormPage,
        handler: Handler(handlerFunc: (_, __) => InputBoxAndFormPage()));
    router.define(rowColumnPage,
        handler: Handler(handlerFunc: (_, __) => RowAndColumnPage()));
    router.define(flexLayoutPage,
        handler: Handler(handlerFunc: (_, __) => FlexiblePage()));
    router.define(wrapFlowPage,
        handler: Handler(handlerFunc: (_, __) => WrapAndFlowPage()));
    router.define(stackPositionedPage,
        handler: Handler(handlerFunc: (_, __) => StackAndPositionedPage()));
    router.define(paddingPage,
        handler: Handler(handlerFunc: (_, __) => PaddingPage()));
    router.define(constrainedBoxSizeBoxPage,
        handler: Handler(handlerFunc: (_, __) => ConstrainedAndSizePage()));
    router.define(decorateBoxPage,
        handler: Handler(handlerFunc: (_, __) => DecorateBoxPage()));
    router.define(transformPage,
        handler: Handler(handlerFunc: (_, __) => TransformPage()));
    router.define(containerPage,
        handler: Handler(handlerFunc: (_, __) => ContainerPage()));
    router.define(scaffoldPage,
        handler: Handler(handlerFunc: (_, __) => ScaffoldRoutePage()));
    router.define(scrollablePage,
        handler: Handler(handlerFunc: (_, __) => ScrollableIntroductionPage()));
    router.define(singleChildScrollviewPage,
        handler: Handler(handlerFunc: (_, __) => SingleChildScrollViewTestPage()));
    router.define(listViewPage,
        handler: Handler(handlerFunc: (_, __) => ListViewTestPage()));
    router.define(gridViewPage,
        handler: Handler(handlerFunc: (_, __) => GridViewTestPage()));
    router.define(customScrollviewPage,
        handler: Handler(handlerFunc: (_, __) => CustomScrollViewTestPage()));
    router.define(scrollstaticrollerListenerPage,
        handler: Handler(handlerFunc: (_, __) => ScrollConstrollerListenerTestPage()));
    router.define(willPopScope,
        handler: Handler(handlerFunc: (_, __) => WillPopScopeTestPage()));
    router.define(inheritedPage,
        handler: Handler(handlerFunc: (_, __) => InheritedWidgetTestPage()));
    router.define(themePage,
        handler: Handler(handlerFunc: (_, __) => ThemeTestPage()));
    router.define(rawPointerEventPage,
        handler: Handler(handlerFunc: (_, __) => RawPointerEventPage()));
    router.define(gestrueRecognitionPage,
        handler: Handler(handlerFunc: (_, __) => GestrueRecognitionTestPage()));
    router.define(eventBusPage,
        handler: Handler(handlerFunc: (_, __) => EventBusTestPage()));
    router.define(notificationPage,
        handler: Handler(handlerFunc: (_, __) => NotificationTestPage()));
    router.define(animationIntroductionPage,
        handler: Handler(handlerFunc: (_, __) => AnimationIntroductionPage()));
    router.define(animationStructurePage,
        handler: Handler(handlerFunc: (_, __) => AnimationStructurePage()));
    router.define(routeTransitionAnimationPage,
        handler: Handler(handlerFunc: (_, __) => RouteTransitionAnimationPage()));
    router.define(heroAnimationPage,
        handler: Handler(handlerFunc: (_, __) => HeroAnimationPage()));
    router.define(straggeredAnimationPage,
        handler: Handler(handlerFunc: (_, __) => StaggeredAnimationPage()));
    router.define(customeWidgetIntroductionPage,
        handler: Handler(handlerFunc: (_, __) => CustomWidgetMethodIntroductionPage()));
    router.define(combinationWidgetPage,
        handler: Handler(handlerFunc: (_, __) => CombinationWidgetPage()));
    router.define(customPaintCanvasPage,
        handler: Handler(handlerFunc: (_, __) => CustomPainCanvasPage()));
    router.define(gradientCircluarProgressPage,
        handler: Handler(handlerFunc: (_, __) => GradientCircularProgressPage()));
    router.define(fileOperationPage,
        handler: Handler(handlerFunc: (_, __) => FileOperationPage()));
    router.define(httpClientPage,
        handler: Handler(handlerFunc: (_, __) => Http_HttpClientPage()));
    router.define(httpDioPackagePage,
        handler: Handler(handlerFunc: (_, __) => HttpDioPage()));


    //
    router.define(focusFirstFlutterPage,
        handler: Handler(handlerFunc: (_, __) => Focus1FirstFlutterWidget()));
    router.define(focusUsingMDPage,
        handler: Handler(handlerFunc: (_, __) => FocusUsingMD()));

    //
    router.define(weekSafeAreaPage,
        handler: Handler(handlerFunc: (_, __) => WeekSafeAreaWidgetPage()));
    router.define(weekExpandedPage,
        handler: Handler(handlerFunc: (_, __) => WeekExpandedWidgetPage()));
    router.define(weekAnimatedContainerPage,
        handler: Handler(handlerFunc: (_, __) => WeekAnimatedContainerWidgetPage()));
    router.define(weekOpacityPage,
        handler: Handler(handlerFunc: (_, __) => WeekOpacityWidgetPage()));
    router.define(weekFutureBuilderPage,
        handler: Handler(handlerFunc: (_, __) => WeekFutureBuilderWidget()));
    router.define(weekFadeTransitionPage,
        handler: Handler(handlerFunc: (_, __) => WeekFadeTransition()));
    router.define(weekFABPage,
        handler: Handler(handlerFunc: (_, __) => WeekFABWidget()));
    router.define(weekPageViewPage,
        handler: Handler(handlerFunc: (_, __) => WeekPageViewWidget()));

    Routes.router = router;
  }
}
