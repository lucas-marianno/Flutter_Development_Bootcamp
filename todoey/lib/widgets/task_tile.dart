import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/constants.dart';
import '../util/task.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  late Offset tapPosition;
  bool dragRight = true;

  double test = 0;

  @override
  Widget build(BuildContext context) {
    Color tileColor = dragRight
        ? ColorTween(
            begin: Colors.transparent,
            end: Colors.lightGreen,
          ).transform(test.abs() / 100)!
        : ColorTween(
            begin: Colors.transparent,
            end: Colors.red[400],
          ).transform(test.abs() / 100)!;

    return GestureDetector(
      onTapDown: (details) => tapPosition = details.globalPosition,
      onHorizontalDragUpdate: (details) {
        dragRight = details.primaryDelta! > 0;
        test += details.primaryDelta! / 2;

        if (test >= 100) test = 100;
        if (test <= -100) test = -100;

        setState(() {});
      },
      onHorizontalDragEnd: (details) {
        if (test >= 100 || test <= -100) {
          if (dragRight) {
            Provider.of<Tasks>(context, listen: false)
                .replaceTask(widget.task, widget.task.toggleIsDone());
          } else {
            Provider.of<Tasks>(context, listen: false).removeTask(widget.task);
          }
        }
        test = 0;
        setState(() {});
      },
      onLongPress: () => showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          tapPosition.dx,
          tapPosition.dy,
          double.infinity,
          double.infinity,
        ),
        items: [
          PopupMenuItem(
            child: const Text('Delete Task'),
            onTap: () => Provider.of<Tasks>(context, listen: false).removeTask(widget.task),
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            widget.task.title,
            style: TextStyle(
              fontSize: kSubTitleFontSize,
              decoration: widget.task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: widget.task.isDone,
            onChanged: (_) => Provider.of<Tasks>(
              context,
              listen: false,
            ).replaceTask(widget.task, widget.task.toggleIsDone()),
          ),
        ),
      ),
    );
  }
}
