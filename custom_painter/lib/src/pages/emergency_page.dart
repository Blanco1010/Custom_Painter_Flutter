import 'package:custom_painter/src/widgets/button_fat.dart';
import 'package:custom_painter/src/widgets/headers_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonFat(),
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
