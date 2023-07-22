import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import '../util/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasklist,
    required this.callback,
  });

  final List<Task> tasklist;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasklist.length,
      itemBuilder: (context, index) {
        return TaskTile(
          task: tasklist[index],
          callback: () {
            tasklist[index].toggleIsDone();
            callback();
          },
        );
      },
    );
  }
}
