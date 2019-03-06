import 'package:flutter/material.dart';

class ScaffoldRoutePage extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoutePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    //创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //设置key
      key: _globalKey,
      //导航栏
      appBar: AppBar(
        title: Text("Material Widget"),
        //左侧widget,常见会抽屉菜单按钮或返回键
        /// 这里必须要使用Builder里面的context，打开抽屉的代码才有用 TODO：原理后续研究
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        elevation: 4.0,
        //导航栏阴影
        actions: <Widget>[
          //右侧菜单列表
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
        //导航栏底部tab按钮组
        bottom: TabBar(
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: _tabController,
        ),
      ),
      //侧滑抽屉
      drawer: MyDrawer(),
      //配合tabBar的点击侧滑widget
      body: TabBarView(
        children: tabs
            .map((e) => Container(
                  alignment: Alignment.center,
                  child: MyBodyContainer(e),
                ))
            .toList(),
        controller: _tabController,
      ),
      //底部导航栏
//      bottomNavigationBar: BottomNavigationBar(
//        items: [
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business), title: Text("business")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school), title: Text("school")),
//        ],
//        currentIndex: _selectedIndex, //默认选中的item
//        fixedColor: Colors.deepOrange,
//        onTap: _onItemTrapped,
//      ),
    bottomNavigationBar: BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        //设置容器中的子widget水平均分
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(icon:Icon(Icons.home),onPressed: (){_onItemTrapped(0);},),
          //中间位置放空盒占位
          SizedBox(),
          IconButton(icon:Icon(Icons.business),onPressed: (){_onItemTrapped(1);},),
        ],
      ),
    ),
      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _openDrawer2,
        child: Icon(Icons.add),
      ),
      //设置悬浮按钮的位置，居于底部导航栏中间
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  ///底部导航栏点击响应事件
  void _onItemTrapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  ///打开抽屉菜单的第二种方式
  void _openDrawer2() {
    _globalKey.currentState.openDrawer();
  }
}

const iconUrl =
    "https://avatars0.githubusercontent.com/u/12468166?s=400&u=d212d36b54219f73d11dc16d444742b75996a3bf&v=4";

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
//        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipOval(
                      child: Image.network(
                        iconUrl,
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "GibsonCool",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text("cxxceo@163.com"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone_android),
                    title: const Text("18687848238"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBodyContainer extends Container {
  final String textStr;

  MyBodyContainer(this.textStr)
      : super(
            margin: EdgeInsets.only(top: 10, left: 50),
            //容器外补白
            constraints: BoxConstraints.tightFor(width: 200, height: 150),
            //限制大小
            decoration: BoxDecoration(
              //修饰背景
              gradient: LinearGradient(
                //水平方向渐变
                colors: [Colors.red, Colors.deepOrange, Colors.purpleAccent],
              ),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            transform: Matrix4.rotationZ(0.2),
            //旋转
            alignment: Alignment.center,
            //文字居中
            child: Text(
              textStr,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ));
}
