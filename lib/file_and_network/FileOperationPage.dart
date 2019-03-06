import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationPage extends StatefulWidget {
  @override
  _FileOperationPageState createState() => _FileOperationPageState();
}

class _FileOperationPageState extends State<FileOperationPage> {
  int _count;

  @override
  void initState() {
    super.initState();
    //从文件读取点击次数
    _readCount().then((value){
      setState(() {
        _count = value;
      });
    });
  }

  //获取文件
  Future<File> _getLocalFile() async {
    //获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  //读取数值
  Future<int> _readCount() async {
    try {
      File file = await _getLocalFile();
      //读取点击次数
      String counts = await file.readAsString();
      return int.parse(counts);
    } on FileSystemException {
      //读取失败返回0
      return 0;
    }
  }

  //写入当前值
  Future<Null> _insertCount() async {
    setState(() {
      _count++;
    });
    //
    await (await _getLocalFile()).writeAsString('$_count');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: ScrollBarColumBody(<Widget>[
        Padding10Text(
          "Dart的IO库包含了文件读写的相关类，它属于Dart语法标准的一部分，所以通过Dart IO库，无论是Dart VM下的脚本还是Flutter，都是通过Dart IO库来操作文件的，不过和Dart VM相比，Flutter有一个重要差异是文件系统路径不同，这是因为Dart VM是运行在PC或服务器操作系统下，而Flutter是运行在移动操作系统中，他们的文件系统会有一些差异。",
          mycolor: Colors.lightBlueAccent,
        ),
        KuaiLePadding10Text("APP目录："),
        Padding10Text(
            "Android和iOS的应用存储目录不同，PathProvider 插件提供了一种平台透明的方式来访问设备文件系统上的常用位置。该类当前支持访问两个文件系统位置："),
        Padding10Text(
            "   临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 系统可随时清除的临时目录（缓存）。在iOS上，这对应于NSTemporaryDirectory() 返回的值。在Android上，这是getCacheDir())返回的值。\n"
            "   文档目录: 可以使用getApplicationDocumentsDirectory()来获取应用程序的文档目录，该目录用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录。在iOS上，这对应于NSDocumentDirectory。在Android上，这是AppData目录。\n"
            "   外部存储目录：可以使用getExternalStorageDirectory()来获取外部存储目录，如SD卡；由于iOS不支持外部目录，所以在iOS下调用该方法会抛出UnsupportedError异常，而在Android下结果是android SDK中getExternalStorageDirectory的返回值。\n"),
        Padding10Text(
          "一旦你的Flutter应用程序有一个文件位置的引用，你可以使用dart:ioAPI来执行对文件系统的读/写操作。我们使用文件保存计数器的值，应用重启后恢复点击次数",
          mycolor: Colors.redAccent,
        ),
        KuaiLePadding10Text("点击了 $_count 次")
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _insertCount,
        tooltip: "点击增加次数",
        child: Icon(Icons.add),
      ),
    );
  }
}
