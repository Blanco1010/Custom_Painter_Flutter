import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/headers_page.dart';
import 'package:custom_painter/src/challenge/box_animation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños APP',
      debugShowCheckedModeBanner: false,
      home: BoxAnimation2(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
