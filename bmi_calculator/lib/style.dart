import 'package:flutter/material.dart';

class Palette {
  static const Color navyPurple = Color(0XFF0A0E21);
  static const Color navyPurpleAccent = Color(0xff1d1e33);
  static const Color pinkish = Color(0xffeb1555);
  static const Color textActive = Colors.white;
  static const Color textInactive = Color(0xff8d8e98);

  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    letterSpacing: 4,
    fontSize: 20,
  );

  static ThemeData themeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: titleTextStyle,
        backgroundColor: navyPurple,
      ),
      cardColor: navyPurpleAccent,
      canvasColor: navyPurple,
      colorScheme: const ColorScheme.dark(
        primary: pinkish,
        // secondary: Colors.amber,
        // tertiary: Colors.red,
        // primaryContainer: Colors.blue,
        // secondaryContainer: Colors.green,
        // tertiaryContainer: Colors.lime,
        // onSurface: Colors.brown,
        // surfaceTint: Colors.pink,
        // surfaceVariant: Colors.pink,
        // background: Colors.orange,
      ),
    );
  }
}
