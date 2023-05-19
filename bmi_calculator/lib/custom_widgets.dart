import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'style.dart';

class ExpandedContainer extends StatelessWidget {
  static const double _margin = 10;
  static const double _borderRadius = 10;

  final Widget? child;
  final Color? backgroundColor;

  const ExpandedContainer({super.key, this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(_margin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: backgroundColor ?? Palette.activeCardColor,
        ),
        child: Center(child: child),
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

class GenderCard extends StatelessWidget {
  static const double _iconSize = 70;
  static const double _gap = 20;

  final String gender;
  final Color backgroundColor;
  final Function callbackFunction;
  const GenderCard(this.gender, this.backgroundColor, this.callbackFunction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => callbackFunction(),
        child: ExpandedContainer(
          backgroundColor: backgroundColor,
          child: StretchedColumn(
            children: [
              Icon(
                gender.toLowerCase() == 'female'
                    ? FontAwesomeIcons.venus
                    : FontAwesomeIcons.mars,
                size: _iconSize,
              ),
              const SizedBox(height: _gap),
              Center(
                  child: Text(
                gender,
                style: Palette.titleTextStyle,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
