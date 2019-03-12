import 'package:flutter/material.dart';

class WeekSafeAreaWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Container(
                color: Colors.red,
                child: _buildList(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Container(
                height: double.infinity,
                color: Colors.amber,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                      'SafeAre:可以保证child widget在可见区域，不被遮挡。例如左右两边的没有被safeArea包裹的在水滴屏或者刘海屏中，头部内容以及底部会遮挡\n'
                      '还可以通过 minimum属性设置距离上下左右的padding值，例如此widget距离底部500 安全距离'),
                ),
              ),
              minimum: EdgeInsets.only(bottom: 500),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.purple,
              child: _buildList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: List.generate(100, (i) => Text('index ： $i')),
    );
  }
}
