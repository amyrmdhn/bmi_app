import 'package:flutter/material.dart';

class BmiViewModel extends ChangeNotifier {
  var _isFemale = 1;
  var _height = 170;

  int get isFemale => _isFemale;
  int get height => _height;

  void setIsFemale(int isFemale) {
    _isFemale = isFemale;
    notifyListeners();
  }

  void setHeight(int height) {
    _height = height;
    notifyListeners();
  }

  void increment() {
    _height++;
    notifyListeners();
  }

  void decrement() {
    _height--;
    notifyListeners();
  }
}
