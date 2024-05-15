import 'package:flutter/material.dart';
import 'Task.dart';
import 'AddTask.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final String title = "Danh sách ToDo";
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
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final Task? newTask = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTask()),
              );
              if (newTask != null) {
                _addTaskItem(newTask);
              }
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          final task = taskList[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              title: Text(task.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mô tả: ${task.description}'),
                  Text('Ngày: ${task.date.toLocal()}'.split(' ')[0]),
                  Text(
                    'Trạng thái: ${task.isCompleted ? "Hoàn thành" : "Chưa hoàn thành"}',
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
