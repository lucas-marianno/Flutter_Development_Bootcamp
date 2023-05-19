import 'package:bmi_calculator/style.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = Palette.inactiveCardColor;
  Color femaleCardColor = Palette.inactiveCardColor;

  void _updateColor(Gender gender) {
    // Toggles the gender cards colors
    setState(() {
      if (gender == Gender.male) {
        maleCardColor = Palette.activeCardColor;
        femaleCardColor = Palette.inactiveCardColor;
      } else if (gender == Gender.female) {
        femaleCardColor = Palette.activeCardColor;
        maleCardColor = Palette.inactiveCardColor;
      }
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
              padding: const EdgeInsets.all(10),
              child: StretchedColumn(
                children: [
                  Expanded(
                    child: StretchedRow(
                      children: [
                        GenderCard(Gender.male, maleCardColor, _updateColor),
                        GenderCard(
                            Gender.female, femaleCardColor, _updateColor),
                      ],
                    ),
                  ),
                  const ExpandedContainer(),
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
                style: Palette.titleTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
