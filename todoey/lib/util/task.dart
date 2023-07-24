import 'dart:collection';

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
  int get taskCount => _taskList.length;
  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  void addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  void replaceTask(Task from, Task to) {
    if (!_taskList.contains(from)) return;

    _taskList[_taskList.indexOf(from)] = to;
    notifyListeners();
  }

  void removeTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }

  final List<Task> _taskList = [];
}
