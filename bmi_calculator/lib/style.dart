import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    elevation: 0,
    titleTextStyle: kTextStyle,
    backgroundColor: kBackgroundColor,
  ),
  cardColor: kActiveCardColor,
  canvasColor: kBackgroundColor,
  colorScheme: const ColorScheme.dark(
    primary: kAccentColor,
  ),
);
