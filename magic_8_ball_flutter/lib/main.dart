import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ball = newBall();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Center(child: Text('ASK ME ANYTHING!')),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                ball = newBall();
              });
            },
            child: Image.asset('images/ball' + ball + '.png'),
          ),
        ),
      ),
    );
  }
}

String newBall() => '${Random().nextInt(5) + 1}';
