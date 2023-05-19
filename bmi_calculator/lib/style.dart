import 'package:flutter/material.dart';

class Palette {
  static const Color backgroundColor = Color(0XFF0A0E21);
  static const Color activeCardColor = Color(0xff1d1e33);
  static const Color inactiveCardColor = Color(0xff111328);
  static const Color accentColor = Color(0xffeb1555);
  static const Color activeText = Colors.white;
  static const Color inactiveText = Color(0xff8d8e98);

  static const TextStyle titleTextStyle = TextStyle(
    color: activeText,
    letterSpacing: 4,
    fontSize: 20,
  );

  static ThemeData themeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: titleTextStyle,
        backgroundColor: backgroundColor,
      ),
      cardColor: activeCardColor,
      canvasColor: backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: accentColor,
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
