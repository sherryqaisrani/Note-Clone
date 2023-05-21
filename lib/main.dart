import 'package:flutter/material.dart';
import 'package:note_clone/models/tasks_model.dart';
import 'package:note_clone/screens/task_screen.dart';
import 'blocs/bloc_exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskBloc()..add(AddTaskEvent(task: TaskModel(title: 'Task1'))),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskScreen(),
      ),
    );
  }
}
