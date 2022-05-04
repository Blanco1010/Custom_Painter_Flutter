import 'package:custom_painter/src/labs/slideshow_page.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:custom_painter/src/pages/graphis_cricle_page.dart';
import 'package:custom_painter/src/pages/animation_page.dart';
import 'package:custom_painter/src/pages/emergency_page.dart';
import 'package:custom_painter/src/pages/pinterest_page.dart';
import 'package:custom_painter/src/pages/slider_list_page.dart';

import '../widgets/headers_widgets.dart';
// import 'package:custom_painter/src/pages/slideshow_page.dart';

final pagesRoute = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slidesshow', SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', PinterestPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Box animation', AnimationPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress bar', GraphicsCirclePage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliderListPage()),
  _Route(FontAwesomeIcons.paintBrush, 'CustomPainter ', HeaderWaves()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
