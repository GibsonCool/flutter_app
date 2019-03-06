import 'package:flutter/material.dart';

///ImageProvider 是一个抽象类，主要定义了图片数据获取的接口load()，
///从不同的数据源获取图片需要实现不同的ImageProvider ，
///如AssetImage是实现了从Asset中加载图片的ImageProvider，
///而NetworkImage实现了从网络加载图片的ImageProvider。

final imgUrl =
//    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4";
    "https://avatars0.githubusercontent.com/u/12468166?s=400&u=d212d36b54219f73d11dc16d444742b75996a3bf&v=4";
final paddingValue = EdgeInsets.all(8);

class ImageAndIconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("图片和Icon"),
        ),

        /// SingleChildScrollView类似于Android中的ScrollView
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /// 加载本地图片的两种方式
              Text("加载本地图片方式一：image:AssetImage(url)"),
              Image(
                image: AssetImage("images/bg_run_lottery.png"),
                width: 150,
              ),
              Text("加载本地图片方式二：Image.asse(url)"),
              Image.asset("images/bg_selected.png"),

              /// 加载网络图片的两种方式
              Text("网络图片方式一：image: NetworkImage(imgUrl"),
              Image(
                image: NetworkImage(imgUrl),
                width: 100,
              ),
              Text("网络图片方式二：Image.network(imgUrl"),
              Image.network(
                imgUrl,
                width: 100,
              ),

//          const Image({
//          ...
//          this.width, //图片的宽
//          this.height, //图片高度
//          this.color, //图片的混合色值
//          this.colorBlendMode, //混合模式
//          this.fit,//缩放模式
//          this.alignment = Alignment.center, //对齐方式
//          this.repeat = ImageRepeat.noRepeat, //重复方式
//          ...
//          })

              MyImgFit(
                  "  BoxFit.fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形", BoxFit.fill),
              MyImgFit(
                  "  BoxFit.contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。",
                  BoxFit.contain),
              MyImgFit(
                  "  BoxFit.cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。",
                  BoxFit.cover),
              MyImgFit(
                  "  BoxFit.fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁",
                  BoxFit.fitWidth),
              MyImgFit(
                  "  BoxFit.fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁",
                  BoxFit.fitHeight),
              MyImgFit(
                  "  BoxFit.none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分",
                  BoxFit.none),
              MyImgColorBlendMode("color:Blue，BlendMode:BlendMode.difference",
                  Colors.blue, BlendMode.difference),
              MyImgColorBlendMode("color:Blue，BlendMode:BlendMode.darken",
                  Colors.blue, BlendMode.darken),
              MyImgColorBlendMode("color:Blue，BlendMode:BlendMode.colorDodge",
                  Colors.blue, BlendMode.colorDodge),
              Padding(
                  padding: paddingValue,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: NetworkImage(imgUrl),
                          width: 100,
                          height: 200,
                          repeat: ImageRepeat.repeatY,
                        ),
                        Text("repeat：当图片本身大小小于显示空间时，指定图片的重复规则")
                      ],
                    ),
                  )),

              Padding(
                  padding: paddingValue,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "\uE914 \uE000 \uE90D",
                          style: TextStyle(
                            fontFamily: "MaterialIcons",
                            fontSize: 24,
                            color: Colors.green
                          ),
                        ),
                        Text("使用Material Design字体图标 通过Text Widget展示")
                      ],
                    ),
                  )),
              Padding(
                  padding: paddingValue,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.accessible,color: Colors.green,),
                        Icon(Icons.error,color: Colors.green,),
                        Icon(Icons.fingerprint,color: Colors.green,),
                        Text("使用Material Design字体图标封装IconData和Icon来展示")
                      ],
                    ),
                  )),
              Image.network(imgUrl),
            ],
          ),
        ));
  }
}

/// 用于展示Image 中 fit 属性
class MyImgFit extends Padding {
  final String description;
  final BoxFit _fit;

  MyImgFit(this.description, this._fit)
      : super(
            padding: paddingValue,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                Image.network(
                  imgUrl,
                  width: 100,
                  height: 60,
                  fit: _fit,
                ),
                Text(description)
              ]),
            ));
}

/// 用于展示Image 中的 color  colorBlendMode 属性
class MyImgColorBlendMode extends Padding {
  final String description;
  final Color _imgColor;
  final BlendMode _blendMode;

  MyImgColorBlendMode(this.description, this._imgColor, this._blendMode)
      : super(
            padding: paddingValue,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Image.network(
                    imgUrl,
                    width: 50,
                    color: _imgColor,
                    colorBlendMode: _blendMode,
                  ),
                  Text("  $description")
                ],
              ),
            ));
}
