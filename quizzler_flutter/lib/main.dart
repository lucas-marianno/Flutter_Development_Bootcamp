import 'package:flutter/material.dart';
import 'package:quizzler_flutter/question.dart';

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
      score.length >= questionaire.length ? score = [] : null;
      score.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    });
  }

  void addWrongAnswer() {
    setState(() {
      score.length >= questionaire.length ? score = [] : null;
      score.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    });
  }

  void nextQuestion() {
    setState(() {
      question == questionaire.length - 1
          ? question = 0
          : question++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Prompt(questionaire[question].prompt),
          CustomButton(true, function: () {
            questionaire[question].answer == true
                ? addCorrectAnswer()
                : addWrongAnswer();
            nextQuestion();
          }),
          CustomButton(false, function: () {
            questionaire[question].answer == false
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
          onPressed: () => function(),
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


