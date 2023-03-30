import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() => runApp(XylophoneApp());

const Map barColor = {
  1: Colors.red,
  2: Colors.orange,
  3: Colors.yellow,
  4: Colors.green,
  5: Colors.teal,
  6: Colors.blue,
  7: Colors.purple,
};

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Bars()),
    );
  }
}

class Bars extends StatelessWidget {
  const Bars({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bar(1),
        Bar(2),
        Bar(3),
        Bar(4),
        Bar(5),
        Bar(6),
        Bar(7),
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final int barId;
  const Bar(this.barId, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        enableFeedback: false,
        onTap: (){
          Audio.load('assets/note'+'$barId'+'.wav')..play()..dispose();
        },
        child: Container(
          color: barColor[barId])),
    );
  }
}
