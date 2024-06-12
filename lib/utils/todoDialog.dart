import 'package:flutter/material.dart';

class Tododialog extends StatelessWidget {
  const Tododialog(
      {super.key, required this.addTodo, required this.textEditingController});

  // logic of adding Todo as paramater cuz if we add the logic here we cant access to the list of
  // todo cuz its on the other class ! so i put the controller and the logic that use this controller "REMOTELLY"

  final VoidCallback addTodo;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[200],
      content: Container(
        margin: const EdgeInsets.only(top: 20),
        child: TextField(
          controller: textEditingController,
          decoration: const InputDecoration(
            hintText: "Add Your Todo",
            border: OutlineInputBorder(),
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL')),
        TextButton(onPressed: addTodo, child: const Text('OK')),
      ],
    );
  }
}
