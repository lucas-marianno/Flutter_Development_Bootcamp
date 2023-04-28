import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'style.dart';
import 'ui_elements.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> score = [];
  int question = 0;

  void _addCorrectAnswer() {
    setState(() {
      score.length >= QuizBrain.questionaireLength() ? score = [] : null;
      score.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    });
  }

  void _addWrongAnswer() {
    setState(() {
      score.length >= QuizBrain.questionaireLength() ? score = [] : null;
      score.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    });
  }

  void _nextQuestion() {
    setState(() {
      question == QuizBrain.questionaireLength() - 1
          ? _displayScore()
          : question++;
    });
  }

  void _displayScore() => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Final Score"),
          content: const Text("content"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  question = 0;
                  score = [];
                });
              },
              child: const Text("restart quiz"),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    /// Builds the application main page Scaffold and positions the UI Elements.

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Prompt(QuizBrain.questionPrompt(question)),
          CustomButton(true, function: () {
            QuizBrain.questionAnswer(question) == true
                ? _addCorrectAnswer()
                : _addWrongAnswer();
            _nextQuestion();
          }),
          CustomButton(false, function: () {
            QuizBrain.questionAnswer(question) == false
                ? _addCorrectAnswer()
                : _addWrongAnswer();
            _nextQuestion();
          }),
          ScoreKeeper(score),
        ],
      ),
    );
  }
}
