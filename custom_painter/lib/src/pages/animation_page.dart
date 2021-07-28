import 'package:flutter/material.dart';
import 'dart:math';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {},
      ),
      body: Center(
        child: BoxAnimation(),
      ),
    );
  }
}

class BoxAnimation extends StatefulWidget {
  @override
  _BoxAnimationState createState() => _BoxAnimationState();
}

class _BoxAnimationState extends State<BoxAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  Animation<double>? rotation;

  Animation<double>? opacity;
  Animation<double>? opacityOut;

  Animation<double>? moveAxisY;

  Animation<double>? enlarge;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    final double radian = pi;

    rotation = Tween(begin: 0.0, end: radian * 2).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.bounceOut,
      ),
    );

    opacity = Tween(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(0.0, 0.70, curve: Curves.linear),
      ),
    );

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1, curve: Curves.linear),
      ),
    );

    moveAxisY = Tween(begin: 0.1, end: -200.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.easeInOutBack,
      ),
    );

    enlarge = Tween(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.easeInOutBack,
      ),
    );

    controller!.addListener(() {
      print(controller!.status);
      if (controller!.isCompleted) {
        controller!.dispose();
      }

      // if (controller!.isCompleted) {
      //   controller!.reverse();
      // } else if (controller!.isDismissed) {
      //   controller!.forward();
      // }
    });
    //Play
    controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    print('end');
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play adn Repeat
    // controller!.repeat();
    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? child) {
        // print('Rotation ${rotation!.status}');
        // print(rotation!.value);
        return Transform.translate(
          offset: Offset(0, moveAxisY!.value),
          child: Transform.rotate(
            angle: rotation!.value,
            child: Opacity(
              opacity: opacity!.value - opacityOut!.value,
              child: Transform.scale(scale: enlarge!.value, child: child),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: Center(
        child: Text(
          ':V',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.amber,
      ),
    );
  }
}
