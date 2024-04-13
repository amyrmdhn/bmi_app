import 'dart:math' as math;

import 'package:flutter/material.dart';

class BMIProgressIndicator extends StatelessWidget {
  const BMIProgressIndicator({
    super.key,
    required this.size,
    required this.bmi,
    required this.duration,
  });

  final double size;
  final double bmi;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.6,
      height: size * 0.6,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black38,
          width: 0.5,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 100,
            spreadRadius: -50,
            blurStyle: BlurStyle.normal,
            color: Color(0xFFff5151),
            offset: Offset(0, 40),
          )
        ],
      ),
      alignment: Alignment.center,
      child: TweenAnimationBuilder(
        //* The progress indicator value. 30.6 is BMI Value and 40 is Max BMI in the world based on WHO research.
        tween: Tween(
          begin: 0.0,
          end: bmi / 40,
        ),
        duration: Duration(milliseconds: duration),
        builder: (context, value, child) {
          //* The percentage value is in the middle of the circle
          double percentage = (value * 100 * 40) / 100;

          return SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                      startAngle: 3 * math.pi / 2,
                      endAngle: 7 * math.pi / 2,
                      tileMode: TileMode.repeated,
                      stops: [
                        value,
                        value,
                      ],
                      center: Alignment.center,
                      colors: [
                        const Color(0xFFff5151),
                        Colors.grey.shade400,
                      ],
                    ).createShader(rect);
                  },
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.red
                      image: DecorationImage(
                        image:
                            Image.asset('assets/images/radial_scale.png').image,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        percentage.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Color(0xFFff5151),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
