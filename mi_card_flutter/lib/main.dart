import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(// creates a margin from areas like status bar, navigation bar, etc
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                foregroundImage: AssetImage("lib/assets/avatar.png"),
              )
            ],
          )
        ),
      ),
    );
  }
}
