import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:custom_painter/models/slider_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _Slides(),
            ),
            _Dots(),
          ],
        ),
      ),
    );
  }
}

// SvgPicture.asset('assets/svgs/slide-1.svg')

class _Slides extends StatefulWidget {
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
        children: [
          _Slide(svg: 'assets/svgs/slide-1.svg'),
          _Slide(svg: 'assets/svgs/slide-2.svg'),
          _Slide(svg: 'assets/svgs/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.08,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(size: size, index: 0),
          _Dot(size: size, index: 1),
          _Dot(size: size, index: 2),
        ],
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
