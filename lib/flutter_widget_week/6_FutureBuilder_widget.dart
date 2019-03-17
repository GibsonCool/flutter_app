import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/HttpDioPage.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/NetworkUtils.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/wanandroid/Api.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/wanandroid/model/HomeBanner.dart';
import 'package:flutter_app/flutter_actual_combat/file_and_network/wanandroid/model/HomeBannerResponse.dart';
import 'package:flutter_app/main.dart';

class WeekFutureBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      body: ScrollBarColumBody([
        Text('FutureBuilder非常适合处理异步数据'
            '它接收一个future，并通过builder生成一个AsyncSnapshot<T>'
            '建议再使用时指定其范型类型，避免后期类型推断失败'
            '你可以通过snapshot的connectionState来判断future状态'
            '从而展现出不同的样式'
            '你还可以通过指定initialData来给asyncSnapshot一个初始值'),
        Height200SizeBox(
          height: 350,
          childWidget: FutureBuilder<List<HomeBanner>>(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Align(
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(child: Text('出错了==>${snapshot.error}'),);
                  }
                  return HomeBannerList(snapshot.data);
                default:
                  return Center();
              }
            },
            future: loadData(),
          ),
        ),
      ]),
    );
  }

  Future<List<HomeBanner>> loadData() async {
    Response rep = await Future.delayed(Duration(seconds: 3)).then((_) {
       return HttpUtil.instance.dioClient.get(Api.homeBanner);
    });
    var data = HomeBannerResponse.fromJson(rep.data)?.data;
    print("doublex =====" + data.toList().toString());
    return Future.value(data);
  }
}
