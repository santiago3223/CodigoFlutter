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
    list.add(Task("Programar mucho mas 3", " mas urgente", 0));
    list[0].subTasks.add(SubTask("programar", "recontra urgente", 0));
    list[0].subTasks.add(SubTask("descanzar", "recontra urgente", 1));
    list[0].subTasks.add(SubTask("descanzar", "recontra urgente", 2));

    List<Color> colores = [Colors.red, Colors.amber, Colors.green];

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => list[index].subTasks.length == 0
          ? ListTile(
              title: Text(
                list[index].name,
              ),
            )
          : ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                list[index].name,
              ),
              children: [
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list[index].subTasks.length,
                    itemBuilder: (c, i) => Card(
                      color: colores[list[index].subTasks[i].state],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(list[index].subTasks[i].name),
                              Text(list[index].subTasks[i].priority),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
