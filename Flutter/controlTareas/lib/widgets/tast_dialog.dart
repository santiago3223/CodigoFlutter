import 'package:controlTareas/models/task.dart';
import 'package:controlTareas/util/dbhelper.dart';
import 'package:flutter/material.dart';

class TaskDialog {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPriority = TextEditingController();

  Widget buildDialog(BuildContext context, Task task, bool isNew) {
    if (isNew) {
      txtName.text = "";
      txtPriority.text = "";
    } else {
      txtName.text = task.name;
      txtPriority.text = task.priority;
    }

    return AlertDialog(
      title: Text(isNew ? "Nueva Tarea" : "Editar Tarea"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                hintText: "Nombre",
              ),
            ),
            TextField(
              controller: txtPriority,
              decoration: InputDecoration(
                hintText: "Prioridad",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () async {
                    DbHelper helper = DbHelper();
                    task.name = txtName.text;
                    task.priority = txtPriority.text;
                    await helper.insertTask(task);
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
                RaisedButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: Text("Cancelar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
