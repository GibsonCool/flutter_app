import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class CustomScrollViewTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //APPBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("CustomScrollView",style: TextStyle(color: Colors.cyan),),
              background: Image.asset("images/test.jpg",fit: BoxFit.fill,),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            //Grid 两列
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 10)],
                    child: Text('小甜甜 Grid Item  $index'),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 4,
              ),
            ),
          ),
          //List
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate((BuildContext context,int index){
              return Container(
                alignment: Alignment.center,
                color: Colors.red[100*(index % 10)],
                child: Text("小仙女 List Item $index"),
              );
            },
            childCount: 50),
          ),
        ],
      ),
    );
  }
}
