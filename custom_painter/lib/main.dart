import 'package:custom_painter/src/themes/themechanger.dart';
import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/launcher.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      title: 'Diseños APP',
      debugShowCheckedModeBanner: false,
      home: LauncherPage(),
    );
  }
}
