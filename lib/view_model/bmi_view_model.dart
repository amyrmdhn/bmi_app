import 'package:flutter/material.dart';

class BmiViewModel extends ChangeNotifier {
  var _isFemale = 1;

  int get isFemale => _isFemale;

  void setIsFemale(int isFemale) {
    _isFemale = isFemale;
    notifyListeners();
  }
}
