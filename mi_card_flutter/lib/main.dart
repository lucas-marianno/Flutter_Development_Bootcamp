import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
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
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
                Text(
                  'flutter developer'.toUpperCase(),
                  style: GoogleFonts.fjallaOne(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    //fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 5,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 350,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      Text('+55 (11) 98964-1709',
                          style: TextStyle(color: Colors.teal, fontSize: 20)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 350,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      Text('GitHub/vulture-coding',
                          style: TextStyle(color: Colors.teal, fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
