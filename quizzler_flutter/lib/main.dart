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

  void addCorrectAnswer() {
    setState(() {
      score.length >= QuizBrain.questionaire.length ? score = [] : null;
      score.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    });
  }

  void addWrongAnswer() {
    setState(() {
      score.length >= QuizBrain.questionaire.length ? score = [] : null;
      score.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    });
  }

  void nextQuestion() {
    setState(() {
      question == QuizBrain.questionaire.length - 1 ? question = 0 : question++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Builds the application main page Scaffold and positions the UI Elements.

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Prompt(QuizBrain.questionaire[question].prompt),
          CustomButton(true, function: () {
            QuizBrain.questionaire[question].answer == true
                ? addCorrectAnswer()
                : addWrongAnswer();
            nextQuestion();
          }),
          CustomButton(false, function: () {
            QuizBrain.questionaire[question].answer == false
                ? addCorrectAnswer()
                : addWrongAnswer();
            nextQuestion();
          }),
          ScoreKeeper(score),
        ],
      ),
    );
  }
}
