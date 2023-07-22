import 'package:flutter/material.dart';
import 'package:todoey/util/constants.dart';
import '../util/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> taskList = [
    Task(title: 'buy shit'),
    Task(title: 'sell shit'),
    Task(title: 'clean shit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBorderRadius),
                  topRight: Radius.circular(kBorderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kHorizontalPadding),
                child: TaskList(
                  tasklist: taskList,
                  callback: () => setState(() {}),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) => AddTaskScreen(
              callback: (newTask) {
                taskList.add(Task(title: newTask));
                Navigator.pop(context);
                setState(() {});
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
