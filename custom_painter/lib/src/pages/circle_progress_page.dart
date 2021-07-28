import 'package:flutter/material.dart';

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
        ),
      ),
    );
  }
}
