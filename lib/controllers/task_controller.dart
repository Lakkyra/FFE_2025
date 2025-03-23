import '../models/task_model.dart';

class TaskController {
  final List<Task> taskList = [];

  void addTask(String title, String description) {
    final task = Task(
      title: title,
      description: description,
      isCompleted: false,
    );
    taskList.add(task);
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
  }

  void toggleTaskCompletion(int index) {
    final task = taskList.elementAt(index);

    taskList[index] = Task(
      title: task.title,
      description: task.description,
      isCompleted: !task.isCompleted,
    );
  }
}
