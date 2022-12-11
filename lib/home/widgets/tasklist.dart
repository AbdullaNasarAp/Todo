import 'package:flutter/material.dart';
import 'package:todoey/%20model/provider/task_data.dart';
import 'package:todoey/home/widgets/task_tile.dart';
import 'package:todoey/ model/task.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    var proTask = Provider.of<TaskData>(context);

    return ListView.builder(
      itemCount: proTask.taskss.length,
      itemBuilder: (
        context,
        index,
      ) {
        return TaskTile(
          longPressCallBack: () {
            proTask.deleteTasks(tasks[index]);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Task deleted ........",
                ),
              ),
            );
          },
          isChecked: proTask.taskss[index].isDone,
          taskTile: proTask.taskss[index].name,
          checkBoxCallBack: (checkBoxState) {
            proTask.updateTasks(tasks[index]);
          },
        );
      },
    );
  }
}
