class Question {
  final String prompt;
  final bool answer;

  Question(this.prompt, this.answer);
}

List<Question> questionaire = [
  Question('You can lead a cow downstairs but not upstairs', false),
  Question('Approximately one quarter of human bones are in the feet.', true),
  Question('A slug\'s blood is green', true),
];