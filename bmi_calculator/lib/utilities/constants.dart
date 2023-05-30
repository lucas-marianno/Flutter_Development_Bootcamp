import 'package:flutter/material.dart';

// Constant Values:
const double kBorderRadius = 10;
const double kFontSize = 20;
const double kGap = 20;
const double kIconSize = 70;
const double kLetterSpacing = 4;
const double kMargin = 10;
const double kPadding = 10;
const double kMinHeight = 50;
const double kMaxHeight = 250;

// Constant Colors:
const Color kAccentColor = Color(0xffeb1555);
const Color kBackgroundColor = Color(0XFF0A0E21);

const Color kActiveText = Colors.white;
const Color kInactiveText = Color(0xff8d8e98);

const Color kActiveCardColor = Color(0xff1d1e33);
const Color kInactiveCardColor = Color(0xff111328);

// Constant Text Styles:
const TextStyle kTextStyle = TextStyle(
  color: kActiveText,
  letterSpacing: kLetterSpacing,
  fontSize: kFontSize,
);

const TextStyle kBoldTextStyle = TextStyle(
  fontSize: kFontSize * 2,
  letterSpacing: kLetterSpacing,
  fontWeight: FontWeight.bold,
);

const TextStyle kBigBoldTextStyle = TextStyle(
  fontSize: kFontSize * 4,
  letterSpacing: kLetterSpacing,
  fontWeight: FontWeight.bold,
);

// Defines whether some ThemeDatas will be applied or not
const bool kAppBarThemeData = true;
const bool kColorSchemeThemeData = true;
const bool kSliderThemeData = true;
