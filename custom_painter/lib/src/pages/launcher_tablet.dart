import 'package:custom_painter/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:custom_painter/src/themes/themechanger.dart';
import 'package:custom_painter/src/routers/routers.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        backgroundColor: appTheme.currentTheme.accentColor,
        centerTitle: true,
      ),
      drawer: _Menu(),
      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            height: double.infinity,
            child: _ListOptions(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: (appTheme.darkTheme)
                ? Colors.grey
                : appTheme.currentTheme.accentColor,
          ),
          Expanded(child: SlideshowPage()),
        ],
      ),
    );
  }
}

class _ListOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pagesRoute.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pagesRoute[i].icon,
          color: appTheme.accentColor,
        ),
        title: Text(pagesRoute[i].title),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.accentColor,
        ),
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) => pagesRoute[i].page,
            ),
          );
        },
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 130,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'JC',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ListOptions()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  activeColor: accentColor,
                  value: appTheme.darkTheme,
                  onChanged: (value) => appTheme.darkTheme = value),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.lightbulb_outline, color: accentColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                    activeColor: accentColor,
                    value: appTheme.customTheme,
                    onChanged: (value) => appTheme.customTheme = value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
