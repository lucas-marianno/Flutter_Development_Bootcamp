import 'package:flutter/material.dart';
import 'package:todoey/util/constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
    required this.callback,
  });

  final void Function(String newTask) callback;

  @override
  Widget build(BuildContext context) {
    String newTask = '';
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kBorderRadius),
          topRight: Radius.circular(kBorderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: kTitle2FontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: kSpacerHeight),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'New task'),
              style: const TextStyle(fontSize: kSubTitleFontSize),
              onChanged: (value) {
                newTask = value;
              },
              onSubmitted: (value) {
                callback(newTask);
              },
            ),
            const SizedBox(height: kSpacerHeight),
            ElevatedButton(
              onPressed: () => callback(newTask),
              child: const Padding(
                padding: EdgeInsets.all(kSpacerHeight),
                child: Text('Add', style: TextStyle(fontSize: kSubTitleFontSize)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
