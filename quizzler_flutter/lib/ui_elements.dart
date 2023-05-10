import 'quiz_brain.dart';
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
  // Creates a Widget that stores the answers right or wrong in a row of icons

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

class CustomButton extends StatelessWidget {
  final bool id;
  final Function function;
  const CustomButton(this.id, {required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    final String buttonName = id ? 'True' : 'False';
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: id ? Colors.green : Colors.red,
          ),
          onPressed: () {
            QuizBrain.checkAnswer(id);
            function();
          },
          child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
