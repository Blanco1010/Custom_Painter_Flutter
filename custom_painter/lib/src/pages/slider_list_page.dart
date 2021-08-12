import 'package:custom_painter/src/themes/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _ListTask(),
      //body: _Title(),
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: 0,
            right: 0,
            child: _ButtonNewList(),
          ),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 80,
      child: MaterialButton(
        color: (appTheme.darkTheme)
            ? appTheme.currentTheme.accentColor
            : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: appTheme.currentTheme.scaffoldBackgroundColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        onPressed: () {
          print('object');
        },
      ),
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
        /*
        SliverAppBar(
          floating: true,
          elevation: 0,
          backgroundColor: Colors.red,
          title: Text('Hola Mundo'),
          centerTitle: true,
        ),
        */

        SliverPersistentHeader(
          floating: false,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 140,
            maxheight: 140,
            child: Container(
              alignment: Alignment.centerLeft,
              child: _Title(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 50),
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return (maxheight != oldDelegate.maxExtent ||
        minExtent != oldDelegate.minExtent);
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10, left: 15),
          child: Text(
            'New',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Colors.black,
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
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : color,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
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
