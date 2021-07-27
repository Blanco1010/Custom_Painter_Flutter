import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    rotation = Tween(begin: 0.0, end: 2.8).animate(controller!);

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play
    controller!.forward();

    return AnimatedBuilder(
      animation: controller!,
      // child: _Rectangle(),
      builder: (BuildContext context, Widget? child) {
        print(rotation!.value);
        return Transform.rotate(angle: rotation!.value, child: _Rectangle());
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
      decoration: BoxDecoration(
        color: Colors.amber,
      ),
    );
  }
}
