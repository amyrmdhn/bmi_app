import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bmi_app/helper.dart';
import '../widgets/bmi_toggle_switch.dart';
import '../../view_model/bmi_view_model.dart';

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            //* Switch for Male or Female BMI Count Configuration
            Selector<BmiViewModel, int>(
              builder: (context, isFemale, child) {
                return BMIToggleSwitch(
                  isFemale: isFemale,
                  onToggle: (index) =>
                      context.read<BmiViewModel>().setIsFemale(index!),
                );
              },
              selector: (context, viewModel) => viewModel.isFemale,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
