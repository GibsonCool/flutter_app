import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class HeroAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("Hero动画："),
        Padding10Text(
            "类似于Android中的'共享元素'过渡动画转换，Hero指的是可以在路由(页面)之间“飞行”的widget，简单来说Hero动画就是在路由切换时，有一个共享的Widget可以在新旧路由间切换，由于共享的Widget在新旧路由页面上的位置、外观可能有所差异，所以在路由切换时会逐渐过渡，这样就会产生一个Hero动画。"),
        Padding10Text(
          "1、当前页面有一个用户头像，圆形，点击跳转B路由页面，可以查看大图\n"
              "2、显示用户头像原图，矩形\n"
              "在两个页面之中跳转的时候，用户头像会逐渐过渡到目标路由页的头像上，点击查看效果",
          mycolor: Colors.blue[300],
        ),
        Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              //唯一标记，前后两个路由页的Hero的tag必须相同
              tag: "double",
              //圆形头像
              child: ClipOval(
                child: Image.asset(
                  "images/test.jpg",
                  width: 80,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 1000),
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: HeroAnimationRouteB(),
                    );
                  },
                ),
              );
            },
          ),
        ),
        Padding10Text(
          "实现Hero动画只需要用Hero Widget将要共享的Widget包装起来，并提供一个相同的tag即可，中间的过渡帧都是Flutter Framework自动完成的。必须要注意， 前后路由页的共享Hero的tag必须是相同的，Flutter Framework内部正式通过tag来对应新旧路由页Widget的对应关系的。\n"
              "Hero动画的原理比较简单，Flutter Framework知道新旧路由页中共享元素的位置和大小，所以根据这两个端点，在动画执行过程中求出过渡时的插值即可，幸运的是，这些事情Flutter已经帮我们做了。",
          mycolor: Colors.red,
        ),

      ]),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
          ),
          KuaiLePadding10Text(
            "大图显示",
            mycolor: Colors.white,
          ),
          Hero(tag: "double", child: Image.asset("images/test.jpg"))
        ],
      ),
    );
  }
}
