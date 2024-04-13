import 'package:flutter/material.dart';
import '../model/bmi.dart';

class BmiViewModel extends ChangeNotifier {
  Bmi? person;

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

  void increment(Value value) {
    if (value == Value.height) _height++;
    if (value == Value.weight) _weight++;
    if (value == Value.age) _age++;
    notifyListeners();
  }

  void decrement(Value value) {
    if (value == Value.height) _height--;
    if (value == Value.weight) _weight--;
    if (value == Value.age) _age--;
    notifyListeners();
  }
}

enum Value {
  height,
  weight,
  age,
}
