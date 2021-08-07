import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonFat extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final Color color2;
  final Function() onPressed;

  const ButtonFat({
    required this.icon,
    required this.title,
    required this.color,
    required this.color2,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          _ButtonFatBackground(
            color: color,
            color2: color2,
            icon: icon,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
                height: 140,
              ),
              FaIcon(
                FontAwesomeIcons.carCrash,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(width: 25),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonFatBackground extends StatelessWidget {
  final Color color;
  final Color color2;
  final IconData icon;

  const _ButtonFatBackground({
    required this.color,
    required this.color2,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(4, 6),
              blurRadius: 10,
            ),
          ],
          gradient: LinearGradient(
            colors: [
              color,
              color2,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              bottom: -30,
              child: FaIcon(
                icon,
                color: Colors.white.withOpacity(0.7),
                size: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
