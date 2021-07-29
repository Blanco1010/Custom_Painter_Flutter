import 'package:custom_painter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraphicsCirclePage extends StatefulWidget {
  @override
  _GraphicsCirclePageState createState() => _GraphicsCirclePageState();
}

class _GraphicsCirclePageState extends State<GraphicsCirclePage> {
  double percentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentaje += 10;
            if (percentaje > 100) {
              percentaje = 0;
            }
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
          child: RadialProgress(
            percentaje: percentaje,
          ),
        ),
      ),
    );
  }
}
