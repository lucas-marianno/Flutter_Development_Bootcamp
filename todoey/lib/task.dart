class Task {
  Task({required this.title, this.isDone = false});

  final String title;
  bool isDone;

  void toggleIsDone() => isDone = !isDone;
}
