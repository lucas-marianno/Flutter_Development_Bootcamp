import 'package:bmi_calculator/utilities/constants.dart';
import 'package:bmi_calculator/utilities/widgets.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
        ),
      ),
      body: StretchedColumn(
        children: [
          const Spacer(flex: 3),
          const ExpandedContainer(
            flex: 4,
            padding: kPadding * 2,
            margin: kMargin * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BMIResults(),
                BMIResultsInformation(),
              ],
            ),
          ),
          const Spacer(flex: 3),
          BottomButton(
              text: 'RE-CALCULATE', onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
