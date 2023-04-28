import 'package:flutter/material.dart';

class Prompt extends StatelessWidget {
  final String question;
  const Prompt(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreKeeper extends StatelessWidget {
  final List<Widget> score;
  const ScoreKeeper(this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: score,
        ),
      ),
    );
  }
}
