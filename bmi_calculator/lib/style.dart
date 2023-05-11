import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData colorPalette() {
  return ThemeData(
    //accentColor: Colors.amber,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
    brightness: Brightness.dark,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.amber),
    textTheme: GoogleFonts.lobsterTextTheme(),
  );
}
