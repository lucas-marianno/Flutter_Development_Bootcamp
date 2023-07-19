import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class TasksTile extends StatelessWidget {
  const TasksTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text('Buy milk', style: TextStyle(fontSize: kSubTitleFontSize)),
      trailing: Checkbox(
        value: true,
        onChanged: (value) {
          // TODO: implement check action
        },
      ),
    );
  }
}
