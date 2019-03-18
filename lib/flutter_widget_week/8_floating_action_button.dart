import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekFABWidget extends StatefulWidget {
  @override
  _WeekFABWidgetState createState() => _WeekFABWidgetState();
}

class _WeekFABWidgetState extends State<WeekFABWidget> {
  int locationIndex = 0;
  List locations = [
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.miniStartTop,
    FloatingActionButtonLocation.endTop,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Button"),
      ),
      body: ScrollBarColumBody([
        Text(
            "FAB(FloatingActionButton) 在Scaffold脚手架widget中，可以配合bottomNavigationBar轻松简单的实现悬浮按钮嵌入其中的效果。点击FAB查看效果")
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (locationIndex == 6)
            locationIndex = 0;
          else
            locationIndex++;
          setState(() {});
        },
        child: Icon(Icons.track_changes),
      ),
      floatingActionButtonLocation: locations[locationIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Container(
          height: 60,
        ),
      ),
    );
  }
}
