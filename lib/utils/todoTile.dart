import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  Todotile(
      {super.key,
      required this.title,
      required this.isChecked,
      required this.checkTodo,
      required this.deletTodo,
      required this.index});

  final String title;
  final bool isChecked;
  final Function(bool?)? checkTodo;
  final Function(int) deletTodo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(5),
              onPressed: (context) => deletTodo(index),
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            )
          ],
        ),
        child: ListTile(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration:
                  isChecked ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          leading: Checkbox(
            fillColor: const WidgetStatePropertyAll(Colors.green),
            value: isChecked,
            onChanged: checkTodo,
          ),
        ),
      ),
    );
  }
}
