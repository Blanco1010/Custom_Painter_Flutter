import 'package:flutter/material.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData iconData;

  PinterestButton({required this.onPressed, required this.iconData});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> itmes = [
    PinterestButton(
        iconData: Icons.pie_chart,
        onPressed: () {
          print('pie');
        }),
    PinterestButton(
        iconData: Icons.search,
        onPressed: () {
          print('buscar');
        }),
    PinterestButton(
        iconData: Icons.notifications,
        onPressed: () {
          print('notificar');
        }),
    PinterestButton(
        iconData: Icons.supervised_user_circle,
        onPressed: () {
          print('user');
        }),
    PinterestButton(
        iconData: Icons.supervised_user_circle,
        onPressed: () {
          print('user');
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return _PinterestMenuBackground(
      child: _MenuItems(items: itmes),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: -5,
            ),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  const _MenuItems({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length,
            (i) => _PinterestMenuButton(index: i, item: items[i])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.iconData,
          size: 25,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
