import 'package:flutter/material.dart';

class ButtonFat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ButtonFatBackground();
  }
}

class _ButtonFatBackground extends StatelessWidget {
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
              Color(0Xff6989F5),
              Color(0Xff906EF5),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Text('Botón gordo'),
    );
  }
}
