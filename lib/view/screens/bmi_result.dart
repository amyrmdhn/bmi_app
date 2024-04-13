import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/helper.dart';
import '../widgets/bmi_progress_indicator.dart';
import '../widgets/calculate_button.dart';
import '../../view_model/bmi_view_model.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Consumer<BmiViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                const Spacer(),
                //* Headline Text : BMI Category
                Text(
                  viewModel.person!.bmiCategories,
                  style: const TextStyle(
                    color: Color(0xFF535456),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                //* Indicator BMI Result with Circle Visual
                BMIProgressIndicator(
                  size: size,
                  bmi: viewModel.person!.bmi,
                  duration: 1500,
                ),
                const Spacer(flex: 2),
                //* Button that functions to move to the details page
                detailButton(),
                const Spacer(flex: 2),
                //* Recalculate Button to recalculate BMI
                CalculateButton(
                  onPressed: () {
                    viewModel.recalculateBmi(context);
                  },
                  text: 'Recalculate',
                  icon: Icons.restart_alt,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox detailButton() {
    return SizedBox(
      width: 170,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          AppRoute.to('/details');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFfb5253),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text('Details'),
      ),
    );
  }
}
