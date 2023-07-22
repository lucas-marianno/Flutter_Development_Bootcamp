import 'package:flutter/material.dart';

class Task {
  Task({required this.title, this.isDone = false});

  final String title;
  bool isDone;

  Task toggleIsDone() {
    isDone = !isDone;
    return this;
  }
}

class Tasks extends ChangeNotifier {
  final List<Task> _taskList = [];

  void addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  List<Task> getTaskList() => _taskList;

  void replaceTask(Task from, Task to) {
    if (!_taskList.contains(from)) return;

    _taskList[_taskList.indexOf(from)] = to;
    notifyListeners();
  }
}
