import 'package:flutter/material.dart';
import 'style.dart';

class MyWidget extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;

  const MyWidget({super.key, this.child, this.backgroundColor});

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

class MyColumn extends StatelessWidget {
  final List<Widget> children;
  const MyColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}

class MyRow extends StatelessWidget {
  final List<Widget> children;
  const MyRow({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}
