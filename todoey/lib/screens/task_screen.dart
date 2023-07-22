import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/util/constants.dart';
import '../util/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> taskList = Provider.of<Tasks>(context).getTaskList();

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // custom app bar
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
              vertical: kVerticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(kSpacerHeight),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: kTitleFontSize,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '${taskList.length} tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: kSubTitleFontSize,
                  ),
                )
              ],
            ),
          ),
          // task list
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBorderRadius),
                  topRight: Radius.circular(kBorderRadius),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(kHorizontalPadding),
                child: TaskList(),
              ),
            ),
          )
        ],
      ),
      // floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) => AddTaskScreen(
              callback: (newTask) {
                Provider.of<Tasks>(context, listen: false).addTask(Task(title: newTask));
                Navigator.pop(context);
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
