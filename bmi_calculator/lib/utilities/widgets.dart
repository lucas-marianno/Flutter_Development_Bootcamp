import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/utilities/calculator.dart';
import 'package:bmi_calculator/utilities/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpandedContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? child;
  final int? flex;
  final double? margin;
  final double? padding;

  const ExpandedContainer(
      {super.key,
      this.backgroundColor,
      this.child,
      this.flex,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Container(
        margin: EdgeInsets.all(padding ?? kMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: backgroundColor ?? kInactiveCardColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(margin ?? kPadding),
          child: Center(child: child),
        ),
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
              style: kBigBoldTextStyle,
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

class BMIResults extends StatelessWidget {
  const BMIResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                BMICalculator.getBMI().toStringAsFixed(2),
                style: kBigBoldTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: kGap),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('BMI', style: kBoldTextStyle),
                  Text(
                    BMICalculator.category(),
                    style: TextStyle(
                      color: BMICalculator.titleColor(),
                      fontSize: kFontSize,
                      letterSpacing: kLetterSpacing,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

class BMIResultsInformation extends StatelessWidget {
  const BMIResultsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Information'),
          Row(
            children: [
              Expanded(child: Container(height: 3)),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text('Underweight'),
                    const Text(''),
                    Container(
                      height: 3,
                      color: kUnderweight,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text('Normal'),
                    const Text(''),
                    Container(height: 3, color: kNormalWeight),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text('Overweight'),
                    const Text(''),
                    Container(height: 3, color: kOverweight),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text('Obese'),
                    const Text(''),
                    Container(height: 3, color: kObese),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(height: 3),
                  ],
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('16.0'),
              Text('18.5'),
              Text('25.0'),
              Text('30.0'),
              Text('40.0'),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: 'Learn more about BMI categories '),
                TextSpan(
                  text: 'here',
                  style: kHyperlinkTextStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchUrl(
                        Uri.parse(
                            'https://en.wikipedia.org/wiki/Body_mass_index'),
                        mode: LaunchMode.externalApplication),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const BottomButton({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Text(
          text,
          style: kTextStyle,
        ),
      ),
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
      /// If heroTag is not null, it will throw an 'There are multiple heroes
      /// that share the same tag within a subtree.'error when using navigation.
      /// To avoid this, either:
      /// - use only one FloatingActionButton per screen. Or
      /// - do not use FloatingActionButton at all and custom build the widget. Or
      /// - set the heroTag to null to avoid the error.
      heroTag: null,
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
                style: kBigBoldTextStyle,
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
