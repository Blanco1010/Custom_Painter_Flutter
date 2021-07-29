import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgressPage extends StatefulWidget {
  @override
  _CircleProgressPageState createState() => _CircleProgressPageState();
}

class _CircleProgressPageState extends State<CircleProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  double percentaje = 0.0;
  double newPercentaje = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    controller!.addListener(() {
      //print('valor: ${controller!.value}');
      setState(() {
        percentaje = lerpDouble(percentaje, newPercentaje, controller!.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percentaje = newPercentaje;
          newPercentaje += 10;
          if (newPercentaje > 100) {
            newPercentaje = 0;
            percentaje = 0;
          }
          controller!.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(
          Icons.refresh,
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MyradialProgress(percentaje),
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
