import 'package:flutter/material.dart';
import 'package:bmi_calculator/utilities/style.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/pages/results_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/input',
      routes: {
        '/input': (context) => const InputPage(),
        '/results': (context) => const ResultsPage(),
      },
    );
  }
}
