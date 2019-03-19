import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/routes.dart';

/// Flutter 中一个简单ListView列表的方式
// 定义商品类
class Product {
  //构造函数,Dart语法提供的简洁方式。
  const Product({this.name});

  final String name;
}

///在Dart中函数就是对象，它的类型是Function类。 typedef为函数提供一个类型别名，就像定义类类型一样。
///可以在声明字段和返回类型使用这个名称
typedef void CartChangedCallback(Product product, bool inCart);

// 定义itemview
class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  // 构造函数:使用初始化列表（initializer list）的方式  在 : product = product中，第一个为this.product 第二个是构造函数传入的参数
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  // 根据是否在购物车中返回不通的状态颜色
  Color _getColor(BuildContext context) =>
      inCart ? Colors.black54 : Theme.of(context).primaryColor;

  TextStyle _getTextStyle(BuildContext context) => !inCart
      ? null
      : new TextStyle(
          color: Colors.black54, decoration: TextDecoration.lineThrough);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
          backgroundColor: _getColor(context),
          child: new Text(product.name[0])),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> productList = <Product>[
    new Product(name: "鸡蛋"),
    new Product(name: "面包"),
    new Product(name: "牛奶薯片"),
    new Product(name: "可比克"),
  ];

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  //购物车数据
  Set<Product> _shoppingCart = new Set<Product>();

  // 从购物车添加或者删除商品
  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.echoPage);
          },
          child: Text(
            WordPair.random().toString(),
            style: TextStyle(fontSize: 11),
            maxLines: 1,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: null,
            child: Image.asset('images/bg_selected2.png'),
          ),
          Image.asset('images/bg_selected.png'),
        ],
        title: new Text("购物清单"),
      ),
      body: new ListView(
        children: widget.productList.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //导航到新路由页面
//          Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return NewRoute();
//          }));
          //通过路由名打开新页面
          print("打开新页面${Routes.newPage}");
          Navigator.pushNamed(context, Routes.newPage);
        },
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
