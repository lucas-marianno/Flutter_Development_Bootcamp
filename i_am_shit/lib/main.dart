import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Center(child: Text('i am shit')),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(100),
            child: Image(
              image: AssetImage('poop_smile.png'),
            ),
          ),
        ),
      ),
    ),
  );
}
