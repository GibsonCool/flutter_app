import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class WeekTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
      ),
      body: ScrollBarColumBody([
        Text('table布局，通俗的讲就是表格。column和row同时存在且不需要滑动的时候\n'
            '可以使用table代替，接受一堆TableRow代表每行\n'
            '每行小部件作战比例通过columnWidths控制\n'
            'columnWidths接受一个map<int,TablecolumnWidth>代表了该行对应下标所对应的小部件所占比例\n'
            '默认为1.0也就是平均分配。如果只设置了其中一个，其他的则按照平均分配比例\n'
            'defaultVerticalAlignment控制row对齐的方式，decoration设置背景颜色。'),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          border: TableBorder.all(color: Colors.white),
          columnWidths: {
//            0: FlexColumnWidth(0.7),
//            1: FlexColumnWidth(0.2)
            1: FractionColumnWidth(0.2),
          },
          children: _buildChildren(),
        ),
      ]),
    );
  }

  List<TableRow> _buildChildren() {
    return [
      _buildTableRow(Colors.redAccent, Colors.blueAccent, Colors.tealAccent),
      _buildTableRow(Colors.blue, Colors.yellow, Colors.pinkAccent),
      _buildTableRow(Colors.lightGreen, Colors.purpleAccent, Colors.teal),
    ];
  }

  TableRow _buildTableRow(color1, color2, color3) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent.withOpacity(0.4)
      ),
      children: [
        _buildTabItem(200, 100, color1, '1'),
        _buildTabItem(100, 100, color2, '2'),
        _buildTabItem(100, 100, color3, '3'),
      ],
    );
  }

  Container _buildTabItem(
      double width, double height, Color color, String value) {
    return Container(
      height: height,
      width: width,
      color: color,
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(color: Colors.white, fontSize: 33.0),
      ),
    );
  }
}
