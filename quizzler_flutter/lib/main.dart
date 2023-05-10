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
  void _update() => setState(() => _checkQuizEnd());

  void _checkQuizEnd() {
    if (QuizBrain.isQuizEnd()) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Final Score"),
          content: Text(QuizBrain.getFinalScore()),
          actions: [
            TextButton(
              onPressed: () {
                QuizBrain.resetQuiz();
                _update();
                Navigator.pop(context);
              },
              child: const Text("restart quiz"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Builds the application Main Page Scaffold and positions the UI Elements.

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Prompt(QuizBrain.getQuestionPrompt()),
          CustomButton(true, function: _update),
          CustomButton(false, function: _update),
          ScoreKeeper(QuizBrain.getScoreWidgetList()),
        ],
      ),
    );
  }
}
