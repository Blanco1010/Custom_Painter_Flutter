import 'package:custom_painter/src/pages/launcher_tablet.dart';
import 'package:custom_painter/src/themes/themechanger.dart';
import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/launcher.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => new ThemeChanger(2),
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
      home: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        final screenSize = MediaQuery.of(context).size;

        if (screenSize.width > 500) {
          return LauncherTabletPage();
        } else {
          return LauncherPage();
        }
      }),
    );
  }
}
