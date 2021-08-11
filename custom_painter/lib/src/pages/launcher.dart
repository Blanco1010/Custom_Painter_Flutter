import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      itemCount: 10,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          FontAwesomeIcons.slideshare,
          color: Colors.blue,
        ),
        title: Text('Hola Mundo'),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {},
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                value: false,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: Colors.blue,
                value: false,
                onChanged: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
