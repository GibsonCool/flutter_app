import 'package:dio/dio.dart';
import 'dart:math' as math;

import 'package:flutter_app/file_and_network/wanandroid/Api.dart';

class HttpUtil {
  static final HttpUtil instance = HttpUtil._internal();

  factory HttpUtil() => instance;

  HttpUtil._internal() {
    if (dioClient == null) {
      BaseOptions options = BaseOptions();
      options.baseUrl = Api.baseUrl;
      options.receiveTimeout = 1000 * 10;
      options.connectTimeout = 5000;

      dioClient = Dio(options);

      ///设置日志拦截器，
      ///[LogInterceptor]中打印 response 内容，
      ///[CustomerInterceptor]中打印 request 内容
      dioClient.interceptors
        //增加日志拦截器
        ..add(LogInterceptor(
            request: false,
            requestHeader: false,
            requestBody: false,
            responseBody: true,
            responseHeader: true))
        //添加自定义日志拦截器
        ..add(CustomerInterceptor());
    }
  }

  Dio dioClient;
}

//自定义拦截器
class CustomerInterceptor extends Interceptor {
  final logSize = 2048;

  @override
  onRequest(RequestOptions options) {
    printKV('uri', options.uri);

    printKV('method', options.method);
    printKV('contentType', options.contentType.toString());
    printKV('responseType', options.responseType.toString());
    printKV('followRedirects', options.followRedirects);
    printKV('connectTimeout', options.connectTimeout);
    printKV('receiveTimeout', options.receiveTimeout);
    printKV('extra', options.extra);

    StringBuffer stringBuffer = new StringBuffer();
    options.headers.forEach((key, v) => stringBuffer.write('\n  $key:$v'));
    printKV('header', stringBuffer.toString());
    stringBuffer.clear();

    print("data:");
    printAll(options.data);
    print("\n");
  }

  @override
  onError(DioError err) {
    print('*** DoubleX DioError ***:');
    print(err);
    if (err.response != null) {
      printKV("error", err.response.toString());
    }
  }

  @override
  onResponse(Response response) {
    printKV("onResponse", "______come from CustomeInterceptor test______");
  }

  printKV(String key, Object v) {
    print('DoubleX-->$key: $v');
  }

  printAll(msg) {
    msg.toString().split("\n").forEach(_printAll);
  }

  _printAll(String msg) {
    int groups = (msg.length / logSize).ceil();
    for (int i = 0; i < groups; ++i) {
      print((i > 0 ? '<<Log follows the previous line: ' : '') +
          msg.substring(
              i * logSize, math.min<int>(i * logSize + logSize, msg.length)));
    }
  }
}
