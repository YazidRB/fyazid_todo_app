import 'package:flutter/material.dart';
import 'package:fyazidrb_todo_app/pages/homePage.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String _todoListBox = 'todoListBox';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(_todoListBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'YazidRB TODO',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'YAZID TO DO ', box: _todoListBox),
    );
  }
}
