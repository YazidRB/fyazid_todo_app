import 'package:hive_flutter/hive_flutter.dart';

class Database {
  List todoList = [];

  // hive box ref
  final todoListBox = Hive.box('todoListBox');

  fetchData() {
    if (todoListBox.get(1) != null) {
      todoList = todoListBox.get(1);
    }
  }

  //update the Database
  updateDatabse() {
    todoListBox.put(1, todoList);
  }
}
