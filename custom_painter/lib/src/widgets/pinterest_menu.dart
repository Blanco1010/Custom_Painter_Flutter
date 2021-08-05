import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData iconData;

  PinterestButton({required this.onPressed, required this.iconData});
}

class PinterestMenu extends StatelessWidget {
  final bool show;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

/*
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
*/
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        opacity: (show) ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;

            Provider.of<_MenuModel>(context).activeColor = this.activeColor;

            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItems(items: items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
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
      children: List.generate(
        items.length,
        (i) => _PinterestMenuButton(index: i, item: items[i]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    final itemSelect = Provider.of<_MenuModel>(context).itemSelect;
    final colors = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelect = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.iconData,
          size: (itemSelect == index) ? 30 : 25,
          color:
              (itemSelect == index) ? colors.activeColor : colors.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelect = 0;

  Color backgroundColor = Colors.white;

  Color activeColor = Colors.black;

  Color inactiveColor = Colors.blueGrey;

  int get itemSelect => this._itemSelect;

  set itemSelect(int vaule) {
    this._itemSelect = vaule;
    notifyListeners();
  }
}
