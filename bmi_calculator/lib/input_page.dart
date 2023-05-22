import 'package:flutter/material.dart';
import 'custom_widgets.dart';
import 'constants.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 165;

  void _updateColor(Gender gender) {
    // Toggles genderCard colors
    setState(() {
      selectedGender = gender;
    });
  }

  void _updateHeight(int h) {
    setState(() {
      height = h;
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
                        GenderCard(Gender.male, selectedGender, _updateColor),
                        GenderCard(Gender.female, selectedGender, _updateColor),
                      ],
                    ),
                  ),
                  HeightWidget(height, _updateHeight),
                  const Expanded(
                    child: StretchedRow(
                      children: [
                        ExpandedContainer(),
                        ExpandedContainer(),
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
