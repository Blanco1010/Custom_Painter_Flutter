import 'package:flutter/material.dart';

class HeaderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: Color(0xff615AAB),
      ),
      height: 250,
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Atributtes
    paint.color = Color(0xff615AAB);
    // first draw with stroke then fill
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2; // width to draw

    final path = new Path();

    //Draw with the path and the paint

    path.moveTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
