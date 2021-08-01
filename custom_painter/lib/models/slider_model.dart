import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;

  get currentPage => this._currentPage;

  set currentpage(double index) {
    this._currentPage = index;
    notifyListeners();
  }
}
