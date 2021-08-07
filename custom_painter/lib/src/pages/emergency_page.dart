import 'package:flutter/material.dart';
import 'package:custom_painter/src/widgets/button_fat.dart';
import 'package:custom_painter/src/widgets/headers_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.text, this.color1, this.color2);
}

final items = <ItemBoton>[
  new ItemBoton(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    Color(0xff6989F5),
    Color(0xff906EF5),
  ),
  new ItemBoton(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    Color(0xff66A9F2),
    Color(0xff536CF6),
  ),
  new ItemBoton(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    Color(0xffF2D572),
    Color(0xffE06AA3),
  ),
  new ItemBoton(
    FontAwesomeIcons.biking,
    'Awards',
    Color(0xff317183),
    Color(0xff46997D),
  ),
  new ItemBoton(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    Color(0xff6989F5),
    Color(0xff906EF5),
  ),
  new ItemBoton(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    Color(0xff66A9F2),
    Color(0xff536CF6),
  ),
  new ItemBoton(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    Color(0xffF2D572),
    Color(0xffE06AA3),
  ),
  new ItemBoton(
    FontAwesomeIcons.biking,
    'Awards',
    Color(0xff317183),
    Color(0xff46997D),
  ),
  new ItemBoton(
    FontAwesomeIcons.carCrash,
    'Motor Accident',
    Color(0xff6989F5),
    Color(0xff906EF5),
  ),
  new ItemBoton(
    FontAwesomeIcons.plus,
    'Medical Emergency',
    Color(0xff66A9F2),
    Color(0xff536CF6),
  ),
  new ItemBoton(
    FontAwesomeIcons.theaterMasks,
    'Theft / Harrasement',
    Color(0xffF2D572),
    Color(0xffE06AA3),
  ),
  new ItemBoton(
    FontAwesomeIcons.biking,
    'Awards',
    Color(0xff317183),
    Color(0xff46997D),
  ),
];

List<Widget> itemMap = items
    .map((e) => ButtonFat(
          icon: e.icon,
          title: e.text,
          color: e.color1,
          color2: e.color2,
          onPressed: () {},
        ))
    .toList();

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(height: 80),
                ...itemMap,
              ],
            ),
          ),
          HeaderPage(),
        ],
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeaderEmergency(
      icon: FontAwesomeIcons.plus,
      title: 'Haz solicitado',
      subtitle: 'Asistencia Médica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
