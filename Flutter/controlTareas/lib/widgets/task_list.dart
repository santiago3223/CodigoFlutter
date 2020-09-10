import 'package:controlTareas/models/subtask.dart';
import 'package:controlTareas/models/task.dart';
import 'package:controlTareas/util/dbhelper.dart';
import 'package:controlTareas/widgets/subtask_dialog.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  int state;
  TaskList(this.state);

  @override
  _TaskListState createState() => _TaskListState(state);
}

class _TaskListState extends State<TaskList> {
  int state;
  List<Task> list = List();
  DbHelper helper = DbHelper();
  List<Color> colores = [Colors.red, Colors.amber, Colors.green];
  SubTaskDialog subTaskDialog = SubTaskDialog();

  _TaskListState(this.state);

  Future showData() async {
    await helper.openDb();
    list = await helper.getTasks(state);
    for (int i = 0; i < list.length; i++) {
      list[i].subTasks = await helper.getSubTasks(list[i].id);
    }
    setState(() {
      list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    showData();

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => list[index].subTasks.length == 0
          ? ListTile(
              title: Text(
                list[index].id.toString() + " " + list[index].name,
              ),
              trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) => subTaskDialog.buildDialog(context,
                            SubTask(null, "", "", 0), true, list[index]));
                  }),
            )
          : ExpansionTile(
              trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) => subTaskDialog.buildDialog(context,
                            SubTask(null, "", "", 0), true, list[index]));
                  }),
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
                    itemBuilder: (c, i) => buildSubTaskCard(index, i, context),
                  ),
                ),
              ],
            ),
    );
  }

  Card buildSubTaskCard(int index, int i, BuildContext context) {
    return Card(
      color: list[index].subTasks[i].state == null
          ? colores[0]
          : colores[list[index].subTasks[i].state],
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 25,
              child: IconButton(
                  iconSize: 15,
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) => subTaskDialog.buildDialog(context,
                            list[index].subTasks[i], false, list[index]));
                  }),
            ),
            Text(list[index].subTasks[i].name),
            Text(list[index].subTasks[i].priority),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 25,
                  child: IconButton(
                      icon: Icon(Icons.arrow_left),
                      onPressed: () async {
                        if (list[index].subTasks[i].state > 0) {
                          list[index].subTasks[i].state--;
                          helper.insertSubTask(
                              list[index].subTasks[i], list[index].id);
                        }
                      }),
                ),
                Container(
                  height: 25,
                  child: IconButton(
                      icon: Icon(Icons.arrow_right),
                      onPressed: () async {
                        if (list[index].subTasks[i].state < 2) {
                          list[index].subTasks[i].state++;
                          helper.insertSubTask(
                              list[index].subTasks[i], list[index].id);
                        }
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
