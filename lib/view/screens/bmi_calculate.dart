import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple_dart/tuple.dart';

import 'package:bmi_app/helper.dart';
import '../widgets/bmi_toggle_switch.dart';
import '../widgets/calculate_button.dart';
import '../widgets/card_number_picker.dart';
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
            //* Height number picker card
            Selector<BmiViewModel, int>(
              builder: (context, height, child) {
                return CardNumberPicker(
                  currentValue: height,
                  onSelectPicker: (height) =>
                      context.read<BmiViewModel>().setHeight(height),
                  onDecrementNumber: () =>
                      context.read<BmiViewModel>().decrement(Value.height),
                  onIncrementNumber: () =>
                      context.read<BmiViewModel>().increment(Value.height),
                  titleText: 'Height',
                  unitText: '(in cm)',
                  widthScale: 0.19,
                  itemCount: 5,
                  hasRuler: true,
                );
              },
              selector: (context, viewModel) => viewModel.height,
            ),
            const Spacer(),
            //* Weight and Age number picker card
            Selector<BmiViewModel, Tuple2<int, int>>(
              builder: (context, viewModel, child) {
                return Row(
                  children: [
                    Expanded(
                      child: CardNumberPicker(
                        currentValue: viewModel.item1,
                        titleText: 'Weight',
                        unitText: '(in kg)',
                        widthScale: 0.30,
                        onSelectPicker: (weight) =>
                            context.read<BmiViewModel>().setWeight(weight),
                        onDecrementNumber: () => context
                            .read<BmiViewModel>()
                            .decrement(Value.weight),
                        onIncrementNumber: () => context
                            .read<BmiViewModel>()
                            .increment(Value.weight),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CardNumberPicker(
                        currentValue: viewModel.item2,
                        titleText: 'Age',
                        widthScale: 0.30,
                        onSelectPicker: (age) =>
                            context.read<BmiViewModel>().setAge(age),
                        onDecrementNumber: () =>
                            context.read<BmiViewModel>().decrement(Value.age),
                        onIncrementNumber: () =>
                            context.read<BmiViewModel>().increment(Value.age),
                      ),
                    ),
                  ],
                );
              },
              selector: (context, viewModel) =>
                  Tuple2(viewModel.weight, viewModel.age),
            ),
            const Spacer(),
            //* Button for calculate
            CalculateButton(
              onPressed: () {
                context.read<BmiViewModel>().calculateBmi(context);
              },
              icon: Icons.arrow_right_alt,
              text: 'Calculate',
            )
          ],
        ),
      ),
    );
  }
}
