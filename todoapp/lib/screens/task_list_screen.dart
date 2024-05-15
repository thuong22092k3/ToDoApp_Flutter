import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final String title = "Task Master";
  List<Task> taskList = [];

  void _addTaskItem(Task task) {
    setState(() {
      taskList.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final Task? newTask = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()),
              );
              if (newTask != null) {
                _addTaskItem(newTask);
              }
            },
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          final task = taskList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.green[50],
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.white,
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ${task.description}'),
                  Text('Date: ${task.date.toLocal()}'.split(' ')[0]),
                  Text(
                    'Status: ${task.isCompleted ? "Completed" : "Not Completed"}',
                  ),
                ],
              ),
              trailing: Checkbox(
                value: task.isCompleted,
                onChanged: (bool? value) {
                  setState(() {
                    task.isCompleted = value ?? false;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
