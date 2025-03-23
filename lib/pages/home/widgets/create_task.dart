import 'package:flutter/material.dart';
import 'package:forward/controllers/task_controller.dart';
import 'package:forward/pages/home/widgets/snack_bar.dart';

class CreateTask extends StatefulWidget {
  //final GlobalKey<AnimatedListState> listKey;
  final TaskController taskController;
  const CreateTask({super.key, required this.taskController});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  // final TaskController _taskController = widget._taskController;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: _descController,
            decoration: const InputDecoration(
              hintText: 'Enter the Description',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _descController.text.isNotEmpty) {
              widget.taskController.addTask(
                _titleController.text,
                _descController.text,
              );
              setState(() {});

              showSnackBar(context, "Task added!");
              Navigator.of(context).pop(true);

              /
            } else {
              showSnackBar(context, "Please enter the required details!");
            }
          },
          child:
              isLoading
                  ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 3,
                    ),
                  )
                  : const Text('Submit'),
        ),
      ],
    );
  }
}
