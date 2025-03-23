import 'package:flutter/material.dart';
import 'package:forward/controllers/task_controller.dart';

import 'package:forward/pages/home/widgets/create_task.dart';
import 'package:forward/pages/home/widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController _taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ToDo List'), centerTitle: true),
      body: Expanded(
        child:
            _taskController.taskList.isEmpty
                ? const Center(child: Text('No tasks!'))
                : ListView.builder(
                  itemCount: _taskController.taskList.length,
                  itemBuilder: (context, index) {
                    final task = _taskController.taskList.elementAt(index);
                    return ListTile(
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (bool? value) {
                          _taskController.toggleTaskCompletion(index);
                          setState(() {});
                        },
                      ),
                      title: TaskTile(task: task),
                      //subtitle: Text(task.description),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _taskController.deleteTask(index);
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => CreateTask(taskController: _taskController),
          );

          if (result == true) {
            setState(() {});
          }
        },

        child: Icon(Icons.add),
      ),
    );
  }
}
