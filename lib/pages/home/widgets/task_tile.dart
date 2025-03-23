import 'package:flutter/material.dart';
import 'package:forward/models/task_model.dart';
import 'package:forward/pages/home/widgets/view_task.dart';

class TaskTile extends StatefulWidget {
  final Task? task;

  const TaskTile({super.key, this.task});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isDeleting = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap:
            () => showDialog(
              context: context,
              builder: (context) => ViewTask(task: widget.task),
            ),
        title: Text(
          widget.task!.title,
          style: TextStyle(
            decoration:
                widget.task!.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
