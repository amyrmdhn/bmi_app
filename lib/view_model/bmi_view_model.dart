import 'package:flutter/material.dart';

class BmiViewModel extends ChangeNotifier {
  var _isFemale = 1;
  var _height = 170;
  var _weight = 72;
  var _age = 25;

  int get isFemale => _isFemale;
  int get height => _height;
  int get weight => _weight;
  int get age => _age;

  void setIsFemale(int isFemale) {
    _isFemale = isFemale;
    notifyListeners();
  }

  void setHeight(int height) {
    _height = height;
    notifyListeners();
  }

  void setWeight(int weight) {
    _weight = weight;
    notifyListeners();
  }

  void setAge(int age) {
    _age = age;
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
