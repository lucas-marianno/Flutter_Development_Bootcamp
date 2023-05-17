import 'package:bmi_calculator/style.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
          const Expanded(
            // Body
            flex: 10,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: StretchedColumn(
                children: [
                  Expanded(
                    child: StretchedRow(
                      children: [
                        GenderCard(),
                        GenderCard(isFemale: true),
                      ],
                    ),
                  ),
                  ExpandedContainer(),
                  Expanded(
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
