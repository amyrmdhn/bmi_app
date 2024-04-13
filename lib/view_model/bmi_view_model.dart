import 'dart:math';

import 'package:flutter/material.dart';

import '../helper.dart';
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

  String bmiCategory(double bmi) {
    if (bmi > 40) return 'Obese Class III';
    if (bmi > 35 && bmi <= 40) return 'Obese Class II';
    if (bmi > 30 && bmi <= 35) return 'Obese Class I';
    if (bmi > 25 && bmi <= 30) return 'Overweight';
    if (bmi > 18.5 && bmi <= 25) return 'Normal';
    if (bmi > 17 && bmi <= 18.5) return 'Mild Thinness';
    if (bmi >= 16 && bmi <= 17) return 'Moderate Thinness';
    return 'Severe Thinness';
  }

  String bmiPrimeCategory(double bmiPrime) {
    if (bmiPrime > 1.6) return 'Obese Class III';
    if (bmiPrime >= 1.4 && bmiPrime <= 1.6) return 'Obese Class II';
    if (bmiPrime >= 1.2 && bmiPrime < 1.4) return 'Obese Class I';
    if (bmiPrime >= 1 && bmiPrime < 1.2) return 'Overweight';
    if (bmiPrime >= 0.74 && bmiPrime < 1) return 'Normal';
    if (bmiPrime >= 0.68 && bmiPrime < 0.744) return 'Mild Thinness';
    if (bmiPrime >= 0.64 && bmiPrime < 0.68) return 'Moderate Thinness';
    return 'Severe Thineess';
  }

  String ponderalIndexCategory(double ponderalIndex) {
    if (ponderalIndex > 17) return 'Obese';
    if (ponderalIndex > 15 && ponderalIndex <= 17) return 'Overweight';
    if (ponderalIndex >= 11 && ponderalIndex <= 15) return 'Normal';
    return 'Underweight';
  }

  String bmiRange(double bmi) {
    if (bmi > 40) return 'more than 40';
    if (bmi > 35 && bmi <= 40) return '35 - 40';
    if (bmi > 30 && bmi <= 35) return '30 - 35';
    if (bmi > 25 && bmi <= 30) return '25 - 30';
    if (bmi > 18.5 && bmi <= 25) return '18.5 - 25';
    if (bmi > 17 && bmi <= 18.5) return '17 - 18.5';
    if (bmi >= 16 && bmi <= 17) return '16 - 17';
    return 'less than 16';
  }

  String ponderalIndexRange(double ponderalIndex) {
    if (ponderalIndex > 17) return '> 17';
    if (ponderalIndex > 15 && ponderalIndex <= 17) return '15 - 17';
    if (ponderalIndex >= 11 && ponderalIndex <= 15) return '11 - 15';
    return '8 - 11';
  }

  void calculateBmi(BuildContext context) {
    final bmi = weight / pow(_height / 100, 2);
    final bmiPrime = bmi / 25;
    final ponderalIndex = weight / pow(_height / 100, 3);
    final bmiCategories = bmiCategory(bmi);
    final bmiPrimeCategories = bmiPrimeCategory(bmiPrime);
    final ponderalIndexCategories = ponderalIndexCategory(ponderalIndex);
    final ponderalIndexRanges = ponderalIndexRange(ponderalIndex);
    final bmiRanges = bmiRange(bmi);

    person = Bmi(
      isFemale: isFemale,
      height: height,
      weight: weight,
      age: age,
      bmi: bmi,
      bmiCategories: bmiCategories,
      bmiRange: bmiRanges,
      bmiPrime: bmiPrime,
      bmiPrimeCategories: bmiPrimeCategories,
      ponderalIndex: ponderalIndex,
      ponderalIndexCategories: ponderalIndexCategories,
      ponderalIndexRange: ponderalIndexRanges,
    );

    AppRoute.toReplace('/results');
  }

  void recalculateBmi(BuildContext context) {
    if (person != null) person = null;
    AppRoute.toReplace('/');
  }
}

enum Value {
  height,
  weight,
  age,
}
