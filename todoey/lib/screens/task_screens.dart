import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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
                const Text(
                  '12 tasks',
                  style: TextStyle(
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
              child: const Padding(
                padding: EdgeInsets.all(kHorizontalPadding),
                child: TaskList(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          // TODO: Slide up a new tasklist
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) => const AddTaskScreen(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
