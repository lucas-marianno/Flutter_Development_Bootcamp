import 'package:flutter/material.dart';
import 'custom_widgets.dart';
import 'constants.dart';

enum Gender { male, female, none }

enum Operator { subtract, add }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _age = 30;
  Gender _selectedGender = Gender.none;
  int _height = 165;
  int _weight = 90;

  void _updateAge(int a) {
    setState(() {
      _age = a;
    });
  }

  void _updateColor(Gender gender) {
    // Toggles genderCard colors
    setState(() {
      _selectedGender = gender;
    });
  }

  void _updateHeight(int h) {
    setState(() {
      _height = h;
    });
  }

  void _updateWeight(int w) {
    setState(() {
      _weight = w;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: StretchedColumn(
        children: [
          Expanded(
            // Body
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: StretchedColumn(
                children: [
                  Expanded(
                    child: StretchedRow(
                      children: [
                        GenderCard(Gender.male, _selectedGender, _updateColor),
                        GenderCard(
                            Gender.female, _selectedGender, _updateColor),
                      ],
                    ),
                  ),
                  HeightWidget(_height, _updateHeight),
                  Expanded(
                    child: StretchedRow(
                      children: [
                        WeightAgeWidget('WEIGHT', _weight, _updateWeight),
                        WeightAgeWidget('AGE', _age, _updateAge),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            // Calculate button
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'CALCULATE',
                style: kTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
