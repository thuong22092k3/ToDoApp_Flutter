import 'package:flutter/material.dart';
import 'ToDo.dart';
import 'AddToDo.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final String title = "To Do List";
  List<ToDo> toDoList = [];

  void _addToDoItem(ToDo toDo) {
    setState(() {
      toDoList.add(toDo);
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
              final ToDo? newToDo = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddToDo()),
              );
              if (newToDo != null) {
                _addToDoItem(newToDo);
              }
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          final toDo = toDoList[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(toDo.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mô tả: ${toDo.description}'),
                Text('Ngày: ${toDo.date.toLocal()}'.split(' ')[0]),
                Text(
                  'Trạng thái: ${toDo.isCompleted ? "Hoàn thành" : "Chưa hoàn thành"}',
                ),
              ],
            ),
            trailing: Checkbox(
              value: toDo.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  toDo.isCompleted = value ?? false;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
