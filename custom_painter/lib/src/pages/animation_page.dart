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

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    final double radian = pi;

    rotation = Tween(begin: 0.0, end: radian * 2).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Curves.bounceOut,
      ),
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(0.50, 1, curve: Curves.linear),
      ),
    );

    controller!.addListener(() {
      print('Status ${controller!.status}');

      if (controller!.isCompleted) {
        controller!.repeat();
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
        print(rotation!.value);
        return Transform.rotate(
          angle: rotation!.value,
          child: Opacity(
            opacity: opacity!.value,
            child: child,
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
