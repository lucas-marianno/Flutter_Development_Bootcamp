import 'package:flutter/material.dart';
import '../util/constants.dart';
import '../util/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.callback,
  });

  final Task task;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: kSubTitleFontSize,
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: (_) => callback(),
      ),
    );
  }
}
