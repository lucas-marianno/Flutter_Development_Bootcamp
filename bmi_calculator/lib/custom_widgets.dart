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
