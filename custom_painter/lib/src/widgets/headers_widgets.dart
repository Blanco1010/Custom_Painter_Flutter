import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    //paint properties
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

class HeaderTriangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      ),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //paint properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    //Draw with paint
    final path = new Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPeak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPeakPainter(),
      ),
    );
  }
}

class _HeaderPeakPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //paint properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    //Draw with paint
    final path = new Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.38);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvePainter(),
      ),
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //paint properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    //Draw with paint
    final path = new Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.width * 0.9, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //paint properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    //Draw with paint
    final path = new Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.30);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.4,
      size.width * 0.5,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.23,
      size.width,
      size.height * 0.3,
    );

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect;
    rect = new Rect.fromCircle(
      center: Offset(0.0, 55.0),
      radius: 200,
    );

    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [
        0.0,
        0.5,
        1.0,
      ],
    );

    final paint = new Paint();
    paint.shader = gradient.createShader(rect);

    //paint properties
    // paint.color = Color(0xff615AAB);
    // paint.color = Colors.red;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    //Draw with paint
    final path = new Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.30);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.4,
      size.width * 0.5,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.23,
      size.width * 1,
      size.height * 0.3,
    );

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderEmergency extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const HeaderEmergency(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderEmergency(
          color: color1,
          color2: color2,
        ),
        Positioned(
          top: -60,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 30),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            FaIcon(
              FontAwesomeIcons.plus,
              size: 90,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderEmergency extends StatelessWidget {
  final Color color;
  final Color color2;

  const _IconHeaderEmergency({
    required this.color,
    required this.color2,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[color, color2],
            stops: [0.0, 0.5]),
      ),
    );
  }
}
