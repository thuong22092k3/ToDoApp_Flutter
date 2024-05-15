import 'package:flutter/material.dart';
import 'screens/task_list_screen.dart';

void main() {
  runApp(TaskMasterApp());
}

class TaskMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Master',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Lato',
      ),
      home: TaskListScreen(),
    );
  }
}
