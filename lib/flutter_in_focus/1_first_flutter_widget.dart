import 'package:flutter/material.dart';

class Focus1FirstFlutterWidget extends StatefulWidget {
  @override
  _Focus1FirstFlutterWidgetState createState() =>
      _Focus1FirstFlutterWidgetState();
}

class _Focus1FirstFlutterWidgetState extends State<Focus1FirstFlutterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:Text('sds'),
      ),
      floatingActionButton: FacncyButton(onPressed: () {}),
    );
  }
}

class FacncyButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  FacncyButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.wb_incandescent,
                color: Colors.amber,
              ),
            ),

            Text('PURCHASE',style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
