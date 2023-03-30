import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Die(),
          Die(),
        ],
      ),
    );
  }
}

class Die extends StatefulWidget {
  const Die({Key key}) : super(key: key);

  @override
  State<Die> createState() => _DieState();
}

class _DieState extends State<Die> {
  String rnd = '6';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            final newrnd = '${Random().nextInt(6) + 1}';
            rnd = rnd == newrnd ? '${Random().nextInt(6) + 1}' : newrnd;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset('images/dice' + rnd + '.png'),
        ),
      ),
    );
  }
}
