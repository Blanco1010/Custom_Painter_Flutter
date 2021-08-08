import 'package:flutter/material.dart';

class SliderListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _ListTask(),
      //body: _Title(),
      body: _MainScroll(),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(title: 'Orange', color: Color(0xffF08F66)),
    _ListItem(title: 'Family', color: Color(0xffF2A38A)),
    _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      slivers: [
        SliverAppBar(
          floating: true,
          elevation: 0,
          backgroundColor: Colors.red,
          title: Text('Hola Mundo'),
          centerTitle: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(items),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10, left: 15),
          child: Text(
            'New',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              child: Text(
                'List',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
                bottom: 6,
                child: Container(
                  width: 120,
                  height: 3,
                  color: Colors.red,
                ))
          ],
        ),
      ],
    );
  }
}

class _ListTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      _ListItem(title: 'Orange', color: Color(0xffF08F66)),
      _ListItem(title: 'Family', color: Color(0xffF2A38A)),
      _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
      _ListItem(title: 'Orange', color: Color(0xffF08F66)),
      _ListItem(title: 'Family', color: Color(0xffF2A38A)),
      _ListItem(title: 'Subscriptions', color: Color(0xffF7CDD5)),
      _ListItem(title: 'Books', color: Color(0xffFCEBAF)),
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, i) => items[i],
    );
  }
}

class _ListItem extends StatelessWidget {
  final Color color;
  final String title;

  const _ListItem({required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }
}
