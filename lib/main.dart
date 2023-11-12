import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_crud/todo_item.dart';
import 'package:todo_app_crud/todo_service.dart';
import 'package:todo_app_crud/todolist_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ToAddItemAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TodoService _todoService = TodoService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _todoService.getAllTodoItems(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ToAddItem>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return TodoListPage();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
