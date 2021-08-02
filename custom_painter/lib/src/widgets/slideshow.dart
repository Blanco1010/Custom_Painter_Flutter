import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool pointUp;
  final Color colorPrimary;
  final Color colorSecondary;
  final double bulletPrimary;
  final double bulletSecondary;
  Slideshow({
    required this.slides,
    this.pointUp = false,
    this.colorPrimary = Colors.blue,
    this.colorSecondary = Colors.grey,
    this.bulletPrimary = 0.04,
    this.bulletSecondary = 0.04,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(builder: (BuildContext context) {
          Provider.of<_SlideshowModel>(context)._colorPrimary =
              this.colorPrimary;
          Provider.of<_SlideshowModel>(context)._colorSecondary =
              this.colorSecondary;

          Provider.of<_SlideshowModel>(context)._bulletPrimary =
              this.bulletPrimary;
          Provider.of<_SlideshowModel>(context)._bulletSecondary =
              this.bulletSecondary;

          return _CreateStructureSlideshow(pointUp: pointUp, slides: slides);
        })),
      ),
    );
  }
}

class _CreateStructureSlideshow extends StatelessWidget {
  const _CreateStructureSlideshow({
    Key? key,
    required this.pointUp,
    required this.slides,
  }) : super(key: key);

  final bool pointUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.pointUp)
          _Dots(
            dots: this.slides.length,
          ),
        Expanded(
          child: _Slides(slides: this.slides),
        ),
        if (!this.pointUp)
          _Dots(
            dots: this.slides.length,
          ),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides({required this.slides});

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageController = new PageController();

  @override
  void initState() {
    pageController.addListener(() {
      // print('Página actual: ${pageController.page}');
      // Update the SliderModel Provider
      Provider.of<_SlideshowModel>(context, listen: false).currentpage =
          pageController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageController,
        physics: BouncingScrollPhysics(),
        /*
        children: [
          _Slide(svg: 'assets/svgs/slide-1.svg'),
          _Slide(svg: 'assets/svgs/slide-2.svg'),
          _Slide(svg: 'assets/svgs/slide-3.svg'),
        ],
        */
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int dots;

  _Dots({
    required this.dots,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.08,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        /*
        children: [
          _Dot(size: size, index: 0),
          _Dot(size: size, index: 1),
          _Dot(size: size, index: 2),
        ],
        */
        children: List.generate(
          dots,
          (index) => _Dot(
            size: size,
            index: index,
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    required this.size,
    required this.index,
  });

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);

    final double sizeBullet;
    final Color colorPoint;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      sizeBullet = ssModel._bulletPrimary;
      colorPoint = ssModel.colorPrimary;
    } else {
      sizeBullet = ssModel._bulletSecondary;
      colorPoint = ssModel.colorSecondary;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size.width * sizeBullet,
      height: size.height * sizeBullet,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        color: colorPoint,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimary = Colors.blue;
  Color _colorSecondary = Colors.grey;

  double _bulletPrimary = 0.04;
  double _bulletSecondary = 0.04;

  set currentpage(double index) {
    this._currentPage = index;
    notifyListeners();
  }

  set colorPrimary(Color color) {
    this._colorPrimary = color;
    notifyListeners();
  }

  set colorSecondary(Color color) {
    this._colorSecondary = color;
    notifyListeners();
  }

  set bulletPrimary(double vaule) {
    this._bulletPrimary = vaule;
    notifyListeners();
  }

  set bulletSecondary(double vaule) {
    this._bulletSecondary = vaule;
    notifyListeners();
  }

  double get currentPage => this._currentPage;

  Color get colorPrimary => this._colorPrimary;
  Color get colorSecondary => this._colorSecondary;

  double get bulletPrimary => this._bulletPrimary;
  double get bulletSecondary => this._bulletSecondary;
}
