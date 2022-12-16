import 'package:flutter/material.dart';

// The main function is the starting point for all our Flutter apps.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('I am rich'),
        ),
        body: const Center(         
          child: Image(image: AssetImage('images/diamond.png')),
        ),
      ),
    ),
  );
}