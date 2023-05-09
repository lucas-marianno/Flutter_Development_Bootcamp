import 'package:flutter/material.dart';

class Question {
  final String prompt;
  final bool answer;

  Question(this.prompt, this.answer);
}

class QuizBrain {
  static int _questionNumber = 0;
  static List<Widget> _score = [];

  static final List<Question> _questionaire = [
    Question('You can lead a cow downstairs but not upstairs', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green', true),
    Question('Some cats are actually allergic to humans', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called "Backrub".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  static String questionPrompt() {
    return _questionaire[_questionNumber].prompt;
  }

  static bool questionAnswer() {
    return _questionaire[_questionNumber].answer;
  }

  static int questionaireLength() => _questionaire.length;

  static int questionNumber() => _questionNumber;

  static void nextQuestion() {
    if (_questionNumber == _questionaire.length - 1) {
      // TODO: call displayScore();
    } else {
      _questionNumber++;
    }
  }

/*

TODO: fix this
  static void displayScore() => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Final Score"),
          content: const Text("content"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  QuizBrain.resetQuestionNumber();
                  _score = [];
                });
              },
              child: const Text("restart quiz"),
            )
          ],
        ),
      );
*/
  static void resetQuestionNumber() => _questionNumber = 0;

  static List<Widget> getScore() => _score;

  static void addCorrectAnswer() {
    _score.length >= QuizBrain.questionaireLength() ? _score = [] : null;
    _score.add(const Icon(
      Icons.check,
      color: Colors.green,
    ));
  }

  static void addWrongAnswer() {
    _score.length >= QuizBrain.questionaireLength() ? _score = [] : null;
    _score.add(const Icon(
      Icons.close,
      color: Colors.red,
    ));
  }
}
