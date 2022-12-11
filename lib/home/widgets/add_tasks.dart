import 'package:flutter/material.dart';

class ShopPop extends StatelessWidget {
  const ShopPop({
    Key? key,
    required this.addTaskCallBack,
  }) : super(key: key);
  final Function addTaskCallBack;

  @override
  Widget build(BuildContext context) {
    String? titleText;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        children: [
          const Text("Add Tasks"),
          TextFormField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (newText) {
              titleText = newText;
            },
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () {
                addTaskCallBack(titleText);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Task Added .......",
                    ),
                  ),
                );
              },
              child: const Text(
                "Create",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
