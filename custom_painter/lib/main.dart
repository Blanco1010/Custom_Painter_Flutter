import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:custom_painter/models/layout_model.dart';
import 'package:custom_painter/src/pages/launcher_tablet.dart';
import 'package:custom_painter/src/themes/themechanger.dart';

import 'package:custom_painter/src/pages/launcher.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => new ThemeChanger(2),
        ),
        ChangeNotifierProvider<LayoutModel>(
          create: (_) => new LayoutModel(),
        ),
      ],
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
