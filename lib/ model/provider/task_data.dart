import 'package:flutter/foundation.dart';
import 'package:todoey/ model/task.dart';

class TaskData with ChangeNotifier {
  List<Task> taskss = [];

  void taskAdd(newTaskTitle) {
    taskss.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTasks(Task task) {
    task.toggleDone();
    notifyListeners();
  } 
  void deleteTasks(Task tasks) {
    taskss.remove(tasks);
    notifyListeners();
  }
}
