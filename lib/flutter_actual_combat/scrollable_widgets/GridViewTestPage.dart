import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class GridViewTestPage extends StatelessWidget {
  final List<Widget> childrensGridView = [
    Container(
      color: Colors.redAccent,
      child: Icon(Icons.map),
    ),
    Container(
      color: Colors.lightGreen,
      child: Icon(Icons.ac_unit),
    ),
    Container(
      color: Colors.lightBlue,
      child: Icon(Icons.airport_shuttle),
    ),
    Container(
      color: Colors.deepOrangeAccent,
      child: Icon(
        Icons.all_inclusive,
        color: Colors.white,
      ),
    ),
    Container(
      color: Colors.indigoAccent,
      child: Icon(Icons.beach_access),
    ),
    Container(
      color: Colors.yellow,
      child: Icon(Icons.cake),
    ),
    Container(
      color: Colors.deepPurple,
      child: Icon(Icons.free_breakfast),
    ),
    Container(
      color: Colors.teal,
      child: Icon(Icons.scatter_plot),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: ScrollBarColumBody(
        <Widget>[
          KuaiLePadding10Text(
              "GridView和ListView的大多数参数都是相同的,需要关注的是gridDelegate参数，"
              "类型是SliverGridDelegate，它的作用是控制GridView子widget如何排列(layout)，"
              "Flutter提供了恋歌SliverGridDelegate的子类："),
          KuaiLePadding10Text("SliverGridDelegateWithFixedCrossAxisCount:"),
          Padding10Text(
            "该子类实现了一个横轴为固定数量子元素的layout算法",
            mycolor: Colors.red,
          ),
          KuaiLePadding10Text("默认构造函数(间距为5，宽高比是1.5,一行3个):"),
          Height200SizeBox(
            childWidget: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //横轴上显示子widget的个数
                childAspectRatio: 1.5, //子widget的宽高比 ，为1时是正方形
                mainAxisSpacing: 5, //主轴方向上的间距，
                crossAxisSpacing: 5, //纵轴方向上的间距
              ),
              children: childrensGridView,
            ),
          ),
          KuaiLePadding10Text(
              "GridView.count构造函数(内部使用了SliverGridDelegateWithFixedCrossAxisCount):"),
          Height200SizeBox(
            childWidget: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: childrensGridView,
            ),
          ),
          KuaiLePadding10Text("SliverGridDelegateWithMaxCrossAxisExtent:"),
          Padding10Text(
            "该子类实现了一个横轴子元素为固定最大长度的layout算法,当maxCrossAxisExtent的值在区间(450/4，450/3]内的话，"
                "子元素最终实际长度都为150,450/150=3,计算出一行也就是3个(这里是没有考虑设置了间距)",
            mycolor: Colors.red,
          ),
          KuaiLePadding10Text("间距：5, maxCrossAxisExtent:100"),
          Height200SizeBox(
            childWidget: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 1.5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              children: childrensGridView,
            ),
          ),
          KuaiLePadding10Text("间距：5, maxCrossAxisExtent:110"),
          Height200SizeBox(
            childWidget: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 110,
                childAspectRatio: 1.5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              children: childrensGridView,
            ),
          ),
          KuaiLePadding10Text(
              "GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent:"),
          Height200SizeBox(
            childWidget: GridView.extent(
              maxCrossAxisExtent: 110,
              childAspectRatio: 1.5,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: childrensGridView,
            ),
          ),
          KuaiLePadding10Text("GridView.builder动态创建子Widget"),
          Height200SizeBox(
            childWidget: InfiniteGridView(),
          ),
        ],
      ),
    );
  }
}

/* 模拟异步加载网络数据，分批获取Icon然后展示 */
class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1.5,
        ),
        itemCount: _icons.length,
        //子widget构建器
        itemBuilder: (context, index) {
          print("itemBuilder: index-->$index");
          if (_icons.length - 1 == index && _icons.length < 200) {
            _retrieveIcons();
          }
          return Container(
            color: Colors.deepOrangeAccent,
            child: Icon(
              _icons[index],
              color: Colors.white,
            ),
          );
        });
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 1000)).then((e) {
      //刷新状态重建
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
          Icons.leak_add,
          Icons.scatter_plot,
          Icons.account_balance
        ]);
      });
    });
  }
}
