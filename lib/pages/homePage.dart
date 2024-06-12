import 'package:flutter/material.dart';
import 'package:fyazidrb_todo_app/utils/todoDialog.dart';
import 'package:fyazidrb_todo_app/utils/todoTile.dart';
import '../data/dataBase.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.box});

  final String title;
  final String box;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Database db = Database();

  @override
  void initState() {
    super.initState();

    db.fetchData();
  }

  // Text add todo controller
  final TextEditingController _textEditingController = TextEditingController();

  // check Todo function
  checkTodo(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];

      db.updateDatabse();
    });
  }

  //add Todo To List
  addTodo() {
    setState(() {
      // add Todo to the app List
      db.todoList.add([_textEditingController.text, false]);
      db.updateDatabse();

      //clear the TextFormFeild
      _textEditingController.clear();
    });
    Navigator.of(context).pop();
  }

  // create a new todo tile
  createTodo() {
    showDialog(
      context: context,
      builder: (context) => Tododialog(
          textEditingController: _textEditingController, addTodo: addTodo),
    );
  }

  // delete Todo from the List
  deletTodo(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateDatabse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: createTodo,
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: db.todoList.isEmpty
              ? Text(
                  "Your Tasks will show up here ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                )
              : ListView.builder(
                  itemCount: db.todoList.length,
                  itemBuilder: (context, index) => Todotile(
                    isChecked: db.todoList[index][1],
                    title: db.todoList[index][0],
                    checkTodo: (val) => checkTodo(index),
                    deletTodo: deletTodo,
                    index: index,
                  ),
                ),
        ));
  }
}
