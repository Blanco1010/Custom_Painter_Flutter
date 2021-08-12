import 'package:custom_painter/src/themes/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:custom_painter/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        //body: PinterestMenu(),
        body: Stack(
          children: [
            PinterestGrid(),
            _PinesterMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinesterMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final show = Provider.of<_MenuModel>(context).show;

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
        bottom: 30,
        child: Container(
          width: width,
          child: Align(
            child: PinterestMenu(
              show: show,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.accentColor,
              inactiveColor: Colors.grey,
              items: [
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
              ],
            ),
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  ScrollController controller = new ScrollController();

  double scrollLast = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollLast) {
        //print('Ocultar el menu');
        if (controller.offset > 0) {
          Provider.of<_MenuModel>(context, listen: false).show = false;
        }
      } else {
        //print('Mostrar el menu');
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      scrollLast = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final List<int> items = List.generate(200, (index) => index);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      physics: BouncingScrollPhysics(),
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool vaule) {
    this._show = vaule;
    notifyListeners();
  }
}
