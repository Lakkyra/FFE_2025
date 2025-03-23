import 'package:flutter/material.dart';
import 'package:forward/models/task_model.dart';

class ViewTask extends StatefulWidget {
  final Task? task;
  const ViewTask({super.key, required this.task});

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.task!.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(widget.task!.description)],
      ),
    );
  }
}
