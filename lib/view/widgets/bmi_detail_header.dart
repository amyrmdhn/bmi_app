import 'package:flutter/material.dart';

import 'bmi_progress_indicator.dart';
import '../../model/bmi.dart';

class BmiDetailHeader extends StatelessWidget {
  const BmiDetailHeader({
    super.key,
    required this.size,
    required this.person,
  });

  final Bmi person;
  final double size;

  @override
  Widget build(BuildContext context) {
    final listOfHeaderContent = {
      'gender': {
        'countText': person.isFemale,
        'letterText': person.isFemale == 1 ? 'Female' : 'Male',
      },
      'age': {'countText': person.age, 'letterText': 'Age'},
      'height': {'countText': person.height, 'letterText': 'Height'},
      'weight': {'countText': person.weight, 'letterText': 'Weight'},
    };

    const letterStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
    );

    const countStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          person.bmiCategories,
          style: const TextStyle(
            color: Color(0xFF535456),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 32),
        BMIProgressIndicator(size: size, bmi: person.bmi, duration: 0),
        const SizedBox(height: 32),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var item in listOfHeaderContent.entries)
                Column(
                  children: [
                    item.value['countText'] == person.isFemale
                        ? person.isFemale == 1
                            ? const Icon(Icons.female, size: 36)
                            : const Icon(Icons.male, size: 36)
                        : Text(
                            '${item.value['countText']}',
                            style: countStyle,
                          ),
                    const SizedBox(height: 8),
                    Text(
                      item.value['letterText'] as String,
                      style: letterStyle,
                    )
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
