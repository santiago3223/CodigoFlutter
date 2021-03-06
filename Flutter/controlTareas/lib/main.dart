import 'package:controlTareas/util/dbhelper.dart';
import 'package:controlTareas/widgets/task_list.dart';
import 'package:controlTareas/widgets/tast_dialog.dart';
import 'package:flutter/material.dart';

import 'models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ControlTareas(),
    );
  }
}

class ControlTareas extends StatelessWidget {
  TaskDialog taskDialog = TaskDialog();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Control de Tareas"),
          bottom: TabBar(tabs: [
            Tab(
              text: "To Do",
            ),
            Tab(
              text: "Doing",
            ),
            Tab(
              text: "Done",
            )
          ]),
        ),
        body: TabBarView(children: [TaskList(0), TaskList(1), TaskList(2)]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => taskDialog.buildDialog(
                    context, Task(null, "", "", 0), true));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
