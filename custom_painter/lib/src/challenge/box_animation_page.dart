import 'package:flutter/material.dart';

class BoxAnimation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.75,
              left: size.width * 0.10,
              child: _BoxAnimation(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BoxAnimation extends StatefulWidget {
  @override
  _BoxAnimationState createState() => _BoxAnimationState();
}

class _BoxAnimationState extends State<_BoxAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  Animation<double>? moveEjeX;
  Animation<double>? moveEjeY;
  Animation<double>? moveEjeX2;
  Animation<double>? moveEjeY2;

  @override
  void initState() {
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 4));

    moveEjeX = Tween(
      begin: 0.0,
      end: 320.0,
    ).animate(CurvedAnimation(
        parent: controller!, curve: Interval(0, 0.25, curve: Curves.bounceIn)));

    moveEjeY = Tween(
      begin: 0.0,
      end: -500.0,
    ).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.25, 0.5, curve: Curves.elasticInOut)));

    moveEjeX2 = Tween(
      begin: 0.0,
      end: -320.0,
    ).animate(CurvedAnimation(
        parent: controller!, curve: Interval(0.5, 0.75, curve: Curves.ease)));

    moveEjeY2 = Tween(
      begin: 0.0,
      end: 500.0,
    ).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1.0, curve: Curves.slowMiddle)));

    controller!.addListener(() {
      if (controller!.status == AnimationStatus.completed) {
        controller!.reset();
      }
    });

    controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller!,
        child: _Box(),
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(
                moveEjeX!.value + moveEjeX2!.value,
                moveEjeY!.value + moveEjeY2!.value,
              ),
              child: child!);
        });
  }
}

class _Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.red),
    );
  }
}
