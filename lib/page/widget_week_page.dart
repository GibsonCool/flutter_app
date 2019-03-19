import 'package:flutter/material.dart';
import 'package:flutter_app/config/routes.dart';
import 'package:flutter_app/main.dart';

class WidgetWeekPage extends StatefulWidget {
  @override
  _WidgetWeekPageState createState() => _WidgetWeekPageState();
}

class _WidgetWeekPageState extends State<WidgetWeekPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widget of the Week'),
      ),
      body: ScrollBarColumBody(<Widget>[
        MyListTile(Colors.redAccent, 0, "SafeArea Widget", Routes.weekSafeAreaPage,
            context),
        MyListTile(Colors.redAccent, 1, "Expanded Widget", Routes.weekExpandedPage,
            context),
        MyListTile(Colors.redAccent, 2, "Wrap Widget", Routes.wrapFlowPage, context),
        MyListTile(Colors.redAccent, 3, "AnimatedContainer Widget",
            Routes.weekAnimatedContainerPage, context),
        MyListTile(Colors.redAccent, 4, "Opacity Widget", Routes.weekOpacityPage,
            context),
        MyListTile(Colors.redAccent, 5, "FutureBuilder Widget",
            Routes.weekFutureBuilderPage, context),
        MyListTile(Colors.redAccent, 6, "FadeTransition Widget",
            Routes.weekFadeTransitionPage, context),
        MyListTile(Colors.redAccent, 7, "FloatingActionButton Widget",
            Routes.weekFABPage, context),
        MyListTile(Colors.redAccent, 7, "PageView Widget", Routes.weekPageViewPage,
            context),
      ]),
    );
  }
}
