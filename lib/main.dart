import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/helper.dart';
import '../view_model/bmi_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BmiViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRoute.navigatorKey,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
