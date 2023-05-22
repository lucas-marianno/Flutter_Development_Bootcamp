import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class ExpandedContainer extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;

  const ExpandedContainer({super.key, this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(kMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: backgroundColor ?? kActiveCardColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final Gender gender;
  final Gender activeGender;
  final Function callbackFunction;

  const GenderCard(this.gender, this.activeGender, this.callbackFunction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    IconData icon = gender == Gender.female
        ? FontAwesomeIcons.venus
        : FontAwesomeIcons.mars;
    String label = gender == Gender.male ? "MALE" : "FEMALE";

    return Expanded(
      child: GestureDetector(
        onTap: () => callbackFunction(gender),
        child: ExpandedContainer(
          backgroundColor:
              activeGender == gender ? kActiveCardColor : kInactiveCardColor,
          child: StretchedColumn(
            children: [
              Icon(icon, size: kIconSize),
              const SizedBox(height: kGap),
              Center(child: Text(label, style: kTextStyle)),
            ],
          ),
        ),
      ),
    );
  }
}

class HeightWidget extends StatelessWidget {
  final int height;
  final Function callBackFunction;
  const HeightWidget(this.height, this.callBackFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
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
            ),
            const Text(
              'cm',
              style: kTextStyle,
            )
          ],
        ),
        Slider(
          value: height.toDouble(),
          onChanged: (double n) {
            callBackFunction(n.toInt());
          },
          min: kMinHeight,
          max: kMaxHeight,
        ),
      ]),
    );
  }
}

class StretchedColumn extends StatelessWidget {
  final List<Widget> children;
  const StretchedColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}

class StretchedRow extends StatelessWidget {
  final List<Widget> children;
  const StretchedRow({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}
