import 'package:flutter/material.dart';
import 'package:flutter_app/page/actual_combat_page.dart';
import 'package:flutter_app/page/in_focus_page.dart';
import 'package:flutter_app/page/widget_week_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<Widget> _tabBodies = [
    ActualCombatPage(),
    InFocusPage(),
    WidgetWeekPage(),
  ];

  final List<_MainTab> _tabItemList = [
    _MainTab("Flutter 实战", 'actual_combat.png', 'actual_combat_normal.png'),
    _MainTab("Flutter in Focus", 'focus.png', 'focus_normal.png'),
    _MainTab("Flutter widget week", 'week.png', 'week_normal.png'),
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabBodies,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: getBottomItems(),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> getBottomItems() {
    List<BottomNavigationBarItem> list = [];
    for (int i = 0; i < _tabItemList.length; i++) {
      var item = BottomNavigationBarItem(
        icon: Image.asset('images/${_tabItemList[i].imgNormal}',width: 30,height: 30,),
        activeIcon: Image.asset("images/${_tabItemList[i].imgPress}",width: 30,height: 30,),
        title: Text(_tabItemList[i].name),
      );
      list.add(item);
    }
    return list;
  }
}

class _MainTab {
  String name;
  String imgPress;
  String imgNormal;

  _MainTab(this.name, this.imgPress, this.imgNormal);
}
