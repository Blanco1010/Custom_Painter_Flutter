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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    percentaje: percentaje, color: Colors.black),
                CustomRadialProgress(
                    percentaje: percentaje, color: Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(percentaje: percentaje, color: Colors.red),
                CustomRadialProgress(
                    percentaje: percentaje, color: Colors.blue),
              ],
            )
          ],
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    required this.percentaje,
    required this.color,
  });

  final double percentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      //color: Colors.red,
      child: RadialProgress(
        percentaje: percentaje,
        colorPrimary: color,
        colorSecondary: Colors.grey,
      ),
    );
  }
}
