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
  // List<Widget> _score = [];
  // int _questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    /// Builds the application Main Page Scaffold and positions the UI Elements.

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Prompt(QuizBrain.questionPrompt()),
          CustomButton(true, function: () {
            QuizBrain.questionAnswer() == true
                ? QuizBrain.addCorrectAnswer()
                : QuizBrain.addWrongAnswer();
            QuizBrain.nextQuestion();
          }),
          CustomButton(false, function: () {
            QuizBrain.questionAnswer() == false
                ? QuizBrain.addCorrectAnswer()
                : QuizBrain.addWrongAnswer();
            QuizBrain.nextQuestion();
          }),
          ScoreKeeper(QuizBrain.getScore()),
        ],
      ),
    );
  }
}
