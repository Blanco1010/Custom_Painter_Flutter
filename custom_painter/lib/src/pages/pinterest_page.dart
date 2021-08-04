import 'package:custom_painter/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: PinterestMenu(),
      body: Stack(
        children: [
          PinterestGrid(),
          _PinesterMenuLocation(),
        ],
      ),
    );
  }
}

class _PinesterMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 30,
        child: Container(
          width: width,
          child: Align(
            child: PinterestMenu(),
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
        print('Ocultar el menu');
      } else {
        print('Mostrar el menu');
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
