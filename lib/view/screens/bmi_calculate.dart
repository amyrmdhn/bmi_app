import 'package:flutter/material.dart';

import 'package:bmi_app/helper.dart';

class BmiCalculateScreen extends StatefulWidget {
  const BmiCalculateScreen({super.key});

  @override
  State<BmiCalculateScreen> createState() => _BmiCalculateScreenState();
}

class _BmiCalculateScreenState extends State<BmiCalculateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const Center(
        child: Text('Initialization'),
      ),
    );
  }
}
