import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/NetworkUtils.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/wanandroid/Api.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/wanandroid/model/HomeBanner.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/wanandroid/model/HomeBannerResponse.dart';
import 'package:flutter_app/main.dart';

class HttpDioPage extends StatefulWidget {
  @override
  _HttpDioPageState createState() => _HttpDioPageState();
}

class _HttpDioPageState extends State<HttpDioPage> {
  String _txt = "";
  List<HomeBanner> datas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http请求Dio package"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("通过Dio发起网络请求，"),
        RaisedButton(
          child: Text("获取wanandroid首页banner数据"),
          onPressed: () async {
            Response response =
                await HttpUtil.instance.dioClient.get(Api.homeBanner);
            setState(() {
              datas = HomeBannerResponse.fromJson(response.data)?.data;
            });
          },
        ),
        Height200SizeBox(
          height: 350,
          childWidget: HomeBannerList(datas),
        ),
      ]),
    );
  }
}

///homeBanner数据列表
class HomeBannerList extends StatefulWidget {
  int length;
  List<HomeBanner> list;

  HomeBannerList(this.list) : length = list.length;

  @override
  _HomeBannerListState createState() => _HomeBannerListState();
}

class _HomeBannerListState extends State<HomeBannerList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.length,
      itemBuilder: (context, index) {
        HomeBanner indexData = widget.list[index];

        return Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.network(indexData.imagePath),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    KuaiLePadding10Text(indexData.title),
                    Text(indexData.desc),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
