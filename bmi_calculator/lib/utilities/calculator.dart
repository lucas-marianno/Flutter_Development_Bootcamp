import 'package:flutter/material.dart';

class BMICalculator {
  static double calculateBMI(int height, int weight) {
    double h = height / 100;
    return (weight / (h * h));
  }

  static Color titleColor(double bmi) {
    if (bmi < 18.5) return Colors.lightBlueAccent;
    if (bmi < 25.0) return Colors.green;
    if (bmi < 30.0) return Colors.orange;
    if (bmi >= 30.0) return Colors.red;

    return Colors.white;
  }

  static String category(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25.0) return 'Normal';
    if (bmi < 30.0) return 'Overweight';
    if (bmi >= 30.0) return 'Obese';

    return '';
  }

  static String message(double bmi) {
    if (bmi < 18.5) {
      return "BMIs under 20 and over 25 have been associated with higher all-cause mortality, with the risk increasing with distance from the 20-25 range.";
    } else if (bmi < 25.0) {
      return 'Normal';
    } else if (bmi < 30.0) {
      return 'Overweight';
    } else if (bmi >= 30.0) {
      return 'Obese';
    }

    return '';
  }
}
