import 'package:flutter/material.dart';

class BmiCalculateScreen extends StatefulWidget {
  const BmiCalculateScreen({super.key});

  @override
  State<BmiCalculateScreen> createState() => _BmiCalculateScreenState();
}

class _BmiCalculateScreenState extends State<BmiCalculateScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Initialization'),
      ),
    );
  }
}
