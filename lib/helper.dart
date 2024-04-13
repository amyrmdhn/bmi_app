import 'package:flutter/material.dart';

import 'view/screens/bmi_calculate.dart';
import 'view/screens/bmi_detail.dart';
import 'view/screens/bmi_result.dart';

class AppRoute {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future toReplace(String route) =>
      navigator.pushReplacementNamed(route);

  static Future to(String route) => navigator.pushNamed(route);
}

final routes = {
  '/': (context) => const BmiCalculateScreen(),
  '/results': (context) => const BmiResultScreen(),
  '/details': (context) => const BmiDetailScreen(),
};

final appBar = AppBar(
  title: const Text('BMI Calculator'),
  centerTitle: true,
);
