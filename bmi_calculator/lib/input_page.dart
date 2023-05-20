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
                  ExpandedContainer(
                    child: StretchedColumn(children: [
                      const Text(
                        "HEIGHT",
                        style: kTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,

                        /// textBaseline MUST BE specified in order to use
                        /// .baseline alignment. Otherwise, flutter won't know
                        /// which baseline to align against.
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kBoldTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            'cm',
                            style: kTextStyle,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        onChanged: (double n) {
                          setState(() {
                            height = n.toInt();
                          });
                        },
                        min: kMinHeight,
                        max: kMaxHeight,
                      ),
                    ]),
                  ),
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
