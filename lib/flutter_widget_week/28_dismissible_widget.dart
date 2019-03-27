import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekDismissibleWidget extends StatefulWidget {
  @override
  _WeekDismissibleWidgetState createState() => _WeekDismissibleWidgetState();
}

class _WeekDismissibleWidgetState extends State<WeekDismissibleWidget> {
  final list = new List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ScrollBarColumBody(<Widget>[
        Text(''),
        SizedBox(
          height: 250,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(color: Colors.redAccent),
                  secondaryBackground: Container(color: Colors.blue),
                  confirmDismiss: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                    } else {
                      print('start to end');
                    }
                    list.removeAt(index);
                    setState(() {});
                    Scaffold.of(context).showSnackBar(
                        new SnackBar(content: new Text("$index dismissed")));
                  },
                  dragStartBehavior: DragStartBehavior.down,
                  key: ValueKey('${list[index]}'),
                  child: ListTile(
                    title: Text('${list[index]}'),
                  ),
                );
              }),
        ),
        Text('www'),
        SizedBox(
          height: 250,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(color: Colors.redAccent),
                  secondaryBackground: Container(color: Colors.blue),
                  direction: index % 2 == 0
                      ? DismissDirection.horizontal
                      : DismissDirection.vertical,
                  confirmDismiss: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                    } else {
                      print('start to end');
                    }
                    list.removeAt(index);
                    setState(() {});
                    Scaffold.of(context).showSnackBar(
                        new SnackBar(content: new Text("$index dismissed")));
                  },
                  dragStartBehavior: DragStartBehavior.down,
                  key: ValueKey('${list[index]}'),
                  child: ListTile(
                    title: Text('${list[index]}'),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
