import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class ListViewTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                KuaiLePadding10Text(
                    "默认构造函数(此方式和使用SingleChildScrollView+Column的方式没有本质的区别):"),
                Height200SizeBox(
                  childWidget: ListView(
                    shrinkWrap: true, //是否根据子widget总长度设置listView的长度
                    padding: const EdgeInsets.all(20),
                    children: <Widget>[
                      const Text('I\'m dedicating every day to you'),
                      const Text('Domestic life was never quite my style'),
                      const Text(
                          'When you smile, you knock me out, I fall apart'),
                      const Text('And I thought I was so smart'),
                    ],
                  ),
                ),
                KuaiLePadding10Text("ListView.builder(只有当子widget真正显示的时候才创建):"),
                Height200SizeBox(
                  childWidget: ListView.builder(
                    itemCount: 100,
                    //子widget的数量
                    itemExtent: 50,
                    //强制每个子widget高度固定(这样指定后，滚动系统可以提前知道列表长度，不用总是动态去计算)
                    ///列表项构建起，根据滚动到具体的index位置，返回生成的widget
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        subtitle: Text("ListTile"),
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepOrange,
                          child: Text(
                            index.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text("index:$index"),
                      );
                    },
                  ),
                ),
                KuaiLePadding10Text(
                    "ListView.separated(比ListView.builder多了一个separatorBuilder参数用于生成列表间的分隔器):"),
                Height200SizeBox(
                  childWidget: ListView.separated(
                    //列表构造器
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        subtitle: Text("ListTile"),
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepOrange,
                          child: Text(
                            index.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text("index:$index"),
                      );
                    },
                    //分割线构造器
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: index % 2 == 0 ? Colors.blue : Colors.green,
                      );
                    },
                    itemCount: 100,
                  ),
                ),
                KuaiLePadding10Text("实现无限加载列表:"),
                Height200SizeBox(
                  childWidget: InfiniteListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/* 无限加载列表 */
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //正在加载标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        //如果到了末尾去判断是继续加载还是现实加载完成
        if (_words[index] == loadingTag) {
          //不足100条，继续加载数据
          if (_words.length <= 100) {
            //获取数据
            _retrieveData();
            //加载动画
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          } else {
            //停止加载数据
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text(
                "没有更多了",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }
        //如果没有就正常显示index的widget
        else {
          return ListTile(
            title: Text(_words[index]),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                index.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
      //分割线
      separatorBuilder: (context, index) => Divider(
            height: 0,
            color: Colors.deepOrange,
          ),
      itemCount: _words.length,
    );
  }

  //获取数据
  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      //在末尾插入20个单词
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      //重构列表
      setState(() {});
    });
  }
}
