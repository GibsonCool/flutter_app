import 'package:flutter/material.dart';
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
        MyListTile(Colors.redAccent, 0, "SafeArea Widget", WEEK_SAFEAREA_WIDGET,
            context),
        MyListTile(Colors.redAccent, 1, "Expanded Widget", WEEK_EXPANDED_WIDGET,
            context),
        MyListTile(Colors.redAccent, 2, "Wrap Widget", WRAP_FLOW_PAGE, context),
        MyListTile(Colors.redAccent, 3, "AnimatedContainer Widget",
            WEEK_ANIMATEDCONTAINER_WIDGET, context),
        MyListTile(Colors.redAccent, 4, "Opacity Widget", WEEK_OPACITY_WIDGET,
            context),
        MyListTile(Colors.redAccent, 5, "FutureBuilder Widget",
            WEEK_FUTUREBUILDER_WIDGET, context),
        MyListTile(Colors.redAccent, 6, "FadeTransition Widget",
            WEEK_FADETRANSITION_WIDGET, context),
        MyListTile(Colors.redAccent, 7, "FloatingActionButton Widget",
            WEEK_FAB_WIDGET, context),
      ]),
    );
  }
}
