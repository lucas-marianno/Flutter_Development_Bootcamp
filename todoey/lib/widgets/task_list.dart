import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/task_tile.dart';
import '../util/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<Tasks>(context).taskCount,
      itemBuilder: (context, index) =>
          TaskTile(task: Provider.of<Tasks>(context).getTaskList()[index]),
    );
  }
}
