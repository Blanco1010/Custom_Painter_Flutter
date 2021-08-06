import 'package:custom_painter/src/pages/emergency_page.dart';
import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/pinterest_page.dart';

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
      //home: PinterestPage(),
      home: EmergencyPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
