import 'package:flutter/material.dart';

ThemeData palette() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        letterSpacing: 4,
        fontSize: 20,
      ),
      backgroundColor: Color(0XFF0A0E21),
    ),
    scaffoldBackgroundColor: const Color(0XFF0A0E21),
    cardColor: const Color(0xff1d1e33),
    canvasColor: Colors.pink,
    colorScheme: const ColorScheme.dark(
        primary: Colors.amber,
        secondary: Colors.deepPurpleAccent,
        tertiary: Colors.red,
        primaryContainer: Colors.blue,
        secondaryContainer: Colors.green,
        tertiaryContainer: Colors.lime,
        surface: Colors.pink, //this should be the color of a card
        onSurface: Colors.brown,
        surfaceTint: Colors.pink,
        surfaceVariant: Colors.pink,
        //background: Color(0XFF0A0E21),
        background: Colors.orange),
  );
}

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
          color: backgroundColor ?? palette().cardColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}
