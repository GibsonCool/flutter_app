import 'package:flutter/material.dart';

class FocusUsingMD extends StatelessWidget {
  final List<DogFeifei> _dogList = [
    DogFeifei(
        name: "菲菲1",
        description: 'just do it',
        age: 1,
        imgUrl: 'images/IMG_0808.JPG'),
    DogFeifei(
        name: "feifei",
        description: 'to bo No.1',
        age: 1,
        imgUrl: 'images/IMG_1092.JPG'),
    DogFeifei(
        name: "my honey",
        description: '谁还不是小仙女呢',
        age: 1,
        imgUrl: 'images/IMG_1366.JPG'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MD widget"),
      ),
      body: ListView.builder(
        itemBuilder: _listItemBuilder,
        itemCount: _dogList.length,
        itemExtent: 60.0,
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _dogList[index])),
      child: Container(
        padding: EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          _dogList[index].name,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }

  _dialogBuilder(BuildContext context, DogFeifei item) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.asset(
          item.imgUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                item.name,
                style: localTheme.textTheme.display1,
              ),
              Text(
                '${item.age} months old',
                style: localTheme.textTheme.subhead.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16.0),
              Text(item.description),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: const Text('取消'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: const Text('确定'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DogFeifei {
  final String name;
  final String description;
  final int age;
  final String imgUrl;

  const DogFeifei({this.name, this.description, this.age, this.imgUrl});
}
