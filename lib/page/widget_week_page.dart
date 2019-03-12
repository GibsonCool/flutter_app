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
      ]),
    );
  }
}
