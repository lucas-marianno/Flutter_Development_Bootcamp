import 'package:bmi_calculator/style.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = Palette.inactiveCardColor;
  Color femaleCardColor = Palette.inactiveCardColor;

  void _updateColor(int gender) {
    setState(() {
      // 1 = male | 2 = female
      if (gender == 1) {
        maleCardColor = Palette.activeCardColor;
        femaleCardColor = Palette.inactiveCardColor;
      } else if (gender == 2) {
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
                        GenderCard(
                            "Male", maleCardColor, () => _updateColor(1)),
                        GenderCard(
                            "Female", femaleCardColor, () => _updateColor(2)),
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
