import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/constants.dart';
import '../util/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

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
        onChanged: (_) => Provider.of<Tasks>(
          context,
          listen: false,
        ).replaceTask(task, task.toggleIsDone()),
      ),
    );
  }
}
