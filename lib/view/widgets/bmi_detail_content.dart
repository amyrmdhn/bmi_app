import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/bmi_view_model.dart';

class BmiDetailContent extends StatelessWidget {
  const BmiDetailContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var primaryStyledText = const TextStyle(
      color: Color(0xFFff5151),
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Consumer<BmiViewModel>(
        builder: (context, viewModel, widget) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'A BMI of ',
                  children: [
                    TextSpan(
                      text: viewModel.person!.bmiRange,
                      style: primaryStyledText,
                    ),
                    const TextSpan(text: ' indicates your weight is in the '),
                    TextSpan(
                      text: viewModel.person!.bmiCategories.toLowerCase(),
                      style: primaryStyledText,
                    ),
                    const TextSpan(
                      text: ' category for a person of your height.',
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text:
                      'BMI Prime is the comparison of an individual\'s BMI with the upper limit of normal BMI, which is 25. Your BMI Prime is ',
                  children: [
                    TextSpan(
                      text: viewModel.person!.bmiPrime.toStringAsFixed(2),
                      style: primaryStyledText,
                    ),
                    const TextSpan(
                      text: ', which falls within the ',
                    ),
                    TextSpan(
                      text: viewModel.person!.bmiPrimeCategories.toLowerCase(),
                      style: primaryStyledText,
                    ),
                    const TextSpan(text: ' range.'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text:
                      'The Ponderal index shows the proportional distribution of body weight relative to body height. Your Ponderal Index is ',
                  children: [
                    TextSpan(
                      text: viewModel.person!.ponderalIndex.toStringAsFixed(1),
                      style: primaryStyledText,
                    ),
                    const TextSpan(text: ' which falls within the '),
                    TextSpan(
                      text: viewModel.person!.ponderalIndexCategories
                          .toLowerCase(),
                      style: primaryStyledText,
                    ),
                    TextSpan(
                      text: ' range (${viewModel.person!.ponderalIndexRange}).',
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
