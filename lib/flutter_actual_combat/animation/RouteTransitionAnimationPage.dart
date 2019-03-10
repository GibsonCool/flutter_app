import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_actual_combat/animation/AnimationIntroductionPage.dart';
import 'package:flutter_app/main.dart';

class RouteTransitionAnimationPage extends StatefulWidget {
  @override
  _RouteTransitionAnimationPageState createState() =>
      _RouteTransitionAnimationPageState();
}

class _RouteTransitionAnimationPageState
    extends State<RouteTransitionAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义路由过渡动画"),
      ),
      body: ScrollBarColumBody(<Widget>[
        KuaiLePadding10Text("自定义路由切换："),
        Padding10Text(
            "Material库中提供了一个MaterialPageRoute，它可以使用和平台风格一致的路由切换动画，如在iOS上会左右滑动切换，而在Android上会上下滑动切换。"),
        MaterialPageRouteButton(
            routeChild: AnimationIntroductionPage(), title: "MD风格示例"),
        Padding10Text("如果在Android上也想使用左右切换风格，可以直接使用CupertinoPageRoute"),
        IOSPageRouteButton(
            routeChild: AnimationIntroductionPage(), title: "IOS风格示例"),
        KuaiLePadding10Text("PageRouteBuilder："),
        Padding10Text("通过PageRouteBuilder可以自定义路由切换动画，例如我们想以渐隐渐入动画来实现路由过渡"),
        CustomePageRouteBuilderButton(
            routeChild: AnimationIntroductionPage(),
            title: "PageRouteBuilder示例"),
        KuaiLePadding10Text("PageRoute:"),
        Padding10Text(
            "无论是MaterialPageRoute、CupertinoPageRoute，还是PageRouteBuilder，它们都继承自PageRoute类，而PageRouteBuilder其实只是PageRoute的一个包装，我们可以直接继承PageRoute类来实现自定义路由"),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, CustomerFadeRoute(builder: (context) {
              return AnimationIntroductionPage();
            }));
          },
          child: Text("PageRoute示例"),
        ),

        KuaiLePadding10Text("实际使用时应考虑优先使用PageRouteBuilder，这样无需定义一个新的路由类，使用起来会比较方便。但是有些时候PageRouteBuilder是不能满足需求的，例如在应用过渡动画时我们需要读取当前路由的一些属性，这时就只能通过继承PageRoute的方式了，举个例子，假如我们只想在打开新路由时应用动画，而在返回时不使用动画，那么我们在构建过渡动画时就必须判断当前路由isActive属性是否为true",mycolor: Colors.red,),
      ]),
    );
  }
}

///PageRouteBuilder自定义路由切换动画
class CustomePageRouteBuilderButton extends StatelessWidget {
  final Widget child;
  final String title;

  const CustomePageRouteBuilderButton({@required routeChild, @required title})
      : child = routeChild,
        title = title;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return FadeTransition(
                //使用渐隐渐入过渡效果
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Text(title),
    );
  }
}

///PageRoute自定义切换动画
class CustomerFadeRoute extends PageRoute {
  final WidgetBuilder builder;
  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  CustomerFadeRoute({@required this.builder,
    this.transitionDuration = const Duration(milliseconds: 1000),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
