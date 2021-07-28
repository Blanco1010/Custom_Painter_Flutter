import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgressPage extends StatefulWidget {
  @override
  _CircleProgressPageState createState() => _CircleProgressPageState();
}

class _CircleProgressPageState extends State<CircleProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: CustomPaint(
            painter: _MyradialProgress(),
          ),
        ),
      ),
    );
  }
}

class _MyradialProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.strokeWidth = 4;
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
