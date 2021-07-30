import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentaje;
  final Color colorPrimary;
  final Color colorSecondary;

  const RadialProgress({
    required this.percentaje,
    this.colorPrimary = Colors.blue,
    this.colorSecondary = Colors.grey,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  double? percentajeLast = 0.0;

  @override
  void initState() {
    percentajeLast = widget.percentaje;

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward(from: 0.0);

    final differentAnimation = widget.percentaje - percentajeLast;
    percentajeLast = widget.percentaje;

    return AnimatedBuilder(
      animation: controller!,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyradialProgress(
              (widget.percentaje - differentAnimation) +
                  (differentAnimation * controller!.value),
              widget.colorPrimary,
              widget.colorSecondary,
            ),
          ),
        );
      },
    );

    /* return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MyradialProgress(widget.percentaje),
      ),
    );
    */
  }
}

class _MyradialProgress extends CustomPainter {
  final percentaje;
  final Color colorPrimary;
  final Color colorSecondary;

  _MyradialProgress(this.percentaje, this.colorPrimary, this.colorSecondary);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: Offset(0, 0), radius: 180);

    final Gradient gradient = new LinearGradient(colors: [
      Color(0xffC012FF),
      Color(0xff6D05E8),
      Colors.red,
    ]);

    //Draw a circle
    final paint = new Paint();
    paint.strokeWidth = 5;
    paint.color = colorSecondary;
    paint.style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //Baw

    final paintBaw = new Paint();
    paintBaw.strokeWidth = 10;
    //paintBaw.color = colorPrimary;
    paintBaw.shader = gradient.createShader(rect);
    paintBaw.strokeCap = StrokeCap.round;
    paintBaw.style = PaintingStyle.stroke;

    //Part to fill out

    final bawAngle = 2 * pi * (percentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      bawAngle,
      false,
      paintBaw,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
