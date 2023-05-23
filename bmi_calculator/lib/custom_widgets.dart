import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class ExpandedContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;

  const ExpandedContainer({super.key, this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(kMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: backgroundColor ?? kInactiveCardColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final Gender activeGender;
  final Gender gender;
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
      child: Container(
        margin: const EdgeInsets.all(kMargin),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: () => callbackFunction(gender),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: activeGender == gender
                  ? kActiveCardColor
                  : kInactiveCardColor,
            ),
            child: StretchedColumn(
              children: [
                Icon(icon, size: kIconSize),
                const SizedBox(height: kGap),
                Center(child: Text(label, style: kTextStyle)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeightWidget extends StatelessWidget {
  final Function callBackFunction;
  final int height;
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

class RoundButton extends StatelessWidget {
  final Function function;
  final Operator op;
  final int weight;
  const RoundButton(this.op, this.weight, this.function, {super.key});

  IconData _operator(Operator op) {
    return op == Operator.subtract ? Icons.remove : Icons.add;
  }

  int _newWeight() {
    return op == Operator.subtract ? weight - 1 : weight + 1;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => function(_newWeight()),
      child: Icon(
        _operator(op),
        size: kIconSize / 2,
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

class WeightAgeWidget extends StatelessWidget {
  final Function callBackFunction;
  final String label;
  final int value;
  const WeightAgeWidget(this.label, this.value, this.callBackFunction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: kTextStyle,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value.toString(),
                style: kBoldTextStyle,
              ),
              Text(
                label == 'WEIGHT' ? 'kg' : '',
                style: kTextStyle,
              ),
            ],
          ),
          const SizedBox(height: kGap),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundButton(Operator.subtract, value, callBackFunction),
              const SizedBox(width: kGap),
              RoundButton(Operator.add, value, callBackFunction),
            ],
          )
        ],
      ),
    );
  }
}
