import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/task_tile.dart';
import '../util/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> taskList = Provider.of<Tasks>(context).getTaskList();

    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) => TaskTile(task: taskList[index]),
    );
  }
}
