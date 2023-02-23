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
          child: Container(
            height: 100,
            width: 100,
            /// EdgeInsets.symetric -> equal padding for horizontal and vertical
            ///           .only     -> padding only for the determine sides
            ///           .all      -> equal padding for all sides
            ///           .fromLTRB -> padding specific for each side
            margin: EdgeInsets.symmetric( //margin: creates a space from the container to its parent
              vertical: 50,
              horizontal: 10,
            ),
            padding: EdgeInsets.all(20), //padding: creates a space from the container to its child
            color: Colors.white,
            child: Text('hi'),
          ),
        ),
      ),
    );
  }
}
