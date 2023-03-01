import 'package:flutter/material.dart';

class MyPalette{
  /// This palette was created at https://www.materialpalette.com/
  /// you simply choose the two material colors that you like
  /// and the website creates the full palette for you
  
  static Color darkPrimaryColor()=> Color(0xff303F9F);
  static Color lightPrimaryColor() => Color(0xffC5CAE9);
  static Color primaryColor() => Color(0xff3F51B5);
  static Color textIconsColor() => Color(0xffFFFFFF);
  static Color accentColor() => Color(0xff009688);
  static Color primaryTextColor() => Color(0xff212121);
  static Color secondaryTextColor() => Color(0xff757575);
  static Color dividerColor() => Color(0xffBDBDBD);
  
  MyPalette();
}

ThemeData myTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(350, 50),
      textStyle: TextStyle(fontSize: 20),
      backgroundColor: MyPalette.textIconsColor(),
      foregroundColor: MyPalette.primaryTextColor(),
    ),
  ),
  dividerTheme: DividerThemeData(
    space: 40,
    color: MyPalette.dividerColor(),
    indent: 100,
    endIndent: 100,
  ),
);