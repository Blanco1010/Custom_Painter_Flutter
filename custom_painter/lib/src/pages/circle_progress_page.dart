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
          padding: EdgeInsets.all(10),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MyradialProgress(50),
          ),
        ),
      ),
    );
  }
}

class _MyradialProgress extends CustomPainter {
  final percentaje;

  _MyradialProgress(this.percentaje);

  @override
  void paint(Canvas canvas, Size size) {
    //Draw a circle
    final paint = new Paint();
    paint.strokeWidth = 5;
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //Baw

    final paintBaw = new Paint();
    paintBaw.strokeWidth = 10;
    paintBaw.color = Colors.pink;
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
