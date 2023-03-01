import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'palette.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          space: 40,
          color: MyPalette.dividerColor(),
          indent: 100,
          endIndent: 100,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MyPalette.primaryColor(),
        body: SafeArea(
          // creates a margin from areas like status bar, navigation bar, etc
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  foregroundImage: AssetImage("lib/assets/avatar.png"),
                ),
                Text(
                  'Lucas Moraes',
                  style: GoogleFonts.lobster(
                    fontSize: 80,
                    color: MyPalette.textIconsColor(),
                    shadows: [
                      Shadow(
                        color:MyPalette.darkPrimaryColor(),
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
                Divider(),
                Text(
                  'flutter developer'.toUpperCase(),
                  style: GoogleFonts.fjallaOne(
                    fontSize: 25,
                    color: MyPalette.textIconsColor(),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8,
                    //fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: MyPalette.darkPrimaryColor(),
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  alignment: Alignment.center,
                  //height: 40,
                  //width: 350,
                  color: MyPalette.textIconsColor(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.phone,
                        color:MyPalette.primaryTextColor(),
                      ),
                      Text('+55 (11) 99999-9999',
                          style: TextStyle(color:MyPalette.primaryTextColor(), fontSize: 20)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  alignment: Alignment.center,
                  //height: 40,
                  //width: 350,
                  color: MyPalette.textIconsColor(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.email,
                        color: MyPalette.primaryTextColor(),
                      ),
                      Text('GitHub/vulture-coding',
                          style: TextStyle(color: MyPalette.primaryTextColor(), fontSize: 20)),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: (){}, child: Text('hi'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
