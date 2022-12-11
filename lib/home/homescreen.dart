import 'package:flutter/material.dart';
import 'package:todoey/%20model/provider/task_data.dart';
import 'package:todoey/home/widgets/add_tasks.dart';
import 'package:todoey/home/widgets/tasklist.dart';
import 'package:provider/provider.dart';

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var taskData = Provider.of<TaskData>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return ShopPop(
                addTaskCallBack:taskData.taskAdd
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 60.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.list,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Todo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Are you ready to do tasks",
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Total Tasks ${taskData.taskss.length}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20.0,
                    ),
                    topRight: Radius.circular(
                      20.0,
                    ),
                  ),
                ),
                child: taskData.taskss.isEmpty
                    ? const Center(
                        child: Text(
                        "Please Add Your Tasks",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ))
                    : TaskList(
                        tasks: taskData.taskss,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
