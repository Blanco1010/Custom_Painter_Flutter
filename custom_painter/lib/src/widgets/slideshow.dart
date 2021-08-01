import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:custom_painter/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;

  Slideshow({required this.slides});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: _Slides(slides: this.slides),
            ),
            _Dots(dots: this.slides.length),
          ],
        ),
      ),
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
      Provider.of<SliderModel>(context, listen: false).currentpage =
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

  _Dots({required this.dots});

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
  const _Dot({required this.size, required this.index});

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    final currentPage = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size.width * 0.04,
      height: size.height * 0.04,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        color: (currentPage >= index - 0.5 && currentPage < index + 0.5)
            ? Colors.blue
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
