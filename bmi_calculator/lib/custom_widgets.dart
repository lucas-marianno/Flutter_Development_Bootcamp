import 'package:flutter/material.dart';
import 'style.dart';

class ExpandedContainer extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;

  const ExpandedContainer({super.key, this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor ?? Palette.navyPurpleAccent,
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
  final bool? isFemale;
  const GenderCard({super.key, this.isFemale});

  @override
  Widget build(BuildContext context) {
    final bool gender = isFemale ?? false;
    return ExpandedContainer(
      child: StretchedColumn(
        children: [
          Icon(
            gender ? Icons.female : Icons.male,
            size: 80,
          ),
          const SizedBox(height: 20),
          Center(
              child: Text(
            gender ? "Female" : "Male",
            style: Palette.titleTextStyle,
          )),
        ],
      ),
    );
  }
}
