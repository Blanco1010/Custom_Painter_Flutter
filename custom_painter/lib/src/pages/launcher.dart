import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:custom_painter/src/themes/themechanger.dart';
import 'package:custom_painter/src/routers/routers.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
        centerTitle: true,
      ),
      drawer: _Menu(),
      body: _ListOptions(),
    );
  }
}

class _ListOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: pagesRoute.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pagesRoute[i].icon,
          color: Colors.blue,
        ),
        title: Text(pagesRoute[i].title),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
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
                  backgroundColor: Colors.blue,
                  child: Text(
                    'JC',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _ListOptions()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  activeColor: Colors.blue,
                  value: appTheme.darkTheme,
                  onChanged: (value) => appTheme.darkTheme = value),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                    activeColor: Colors.blue,
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
