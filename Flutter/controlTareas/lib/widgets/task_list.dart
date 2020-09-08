import 'package:controlTareas/models/subtask.dart';
import 'package:controlTareas/models/task.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> list = List();

  @override
  Widget build(BuildContext context) {
    list.add(Task("Programar mucho", "urgente", 0));
    list.add(Task("Programar mucho mas", " mas urgente", 0));
    list[0].subTasks.add(SubTask("programar", "recontra urgente", 0));
    list[0].subTasks.add(SubTask("programar2", "recontra urgente", 0));
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => Column(
        children: [
          ListTile(
            title: Text(
              list[index].name,
            ),
          ),
          ListView.builder(
              itemBuilder: (c, i) => Text(list[index].subTasks[i].name)),
        ],
      ),
    );
  }
}
