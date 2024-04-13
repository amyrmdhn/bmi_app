import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bmi_detail_content.dart';
import '../widgets/bmi_detail_header.dart';
import '../../view_model/bmi_view_model.dart';

class BmiDetailScreen extends StatelessWidget {
  const BmiDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Consumer<BmiViewModel>(
          builder: (BuildContext context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  //* Contains BMI Text Categories, Progress Indicator and Person Card Details
                  BmiDetailHeader(
                    person: viewModel.person!,
                    size: size,
                  ),
                  const SizedBox(height: 16),
                  const BmiDetailContent(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
