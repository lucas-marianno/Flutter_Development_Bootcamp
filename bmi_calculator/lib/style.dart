import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData themeData = ThemeData(
  appBarTheme: kAppBarThemeData
      ? const AppBarTheme(
          backgroundColor: kBackgroundColor,
          elevation: 0,
          titleTextStyle: kTextStyle,
        )
      : const AppBarTheme(),
  canvasColor: kBackgroundColor,
  cardColor: kActiveCardColor,
  colorScheme: kColorSchemeThemeData
      ? const ColorScheme.dark(
          primary: kAccentColor,
        )
      : const ColorScheme.light(),
  sliderTheme: kSliderThemeData
      ? const SliderThemeData(
          //thumbColor: Colors.amber,
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
          trackHeight: 1,
        )
      : const SliderThemeData(),
);
