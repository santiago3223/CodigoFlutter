import 'package:controlTareas/models/subtask.dart';
import 'package:controlTareas/models/task.dart';
import 'package:controlTareas/util/dbhelper.dart';
import 'package:flutter/material.dart';

class SubTaskDialog {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPriority = TextEditingController();

  Widget buildDialog(
      BuildContext context, SubTask subTask, bool isNew, Task task) {
    return AlertDialog(
      title: Text(isNew ? "Nueva SubTarea" : "Editar SubTarea"),
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
                    subTask.name = txtName.text;
                    subTask.priority = txtPriority.text;
                    await helper.insertSubTask(subTask, task.id);
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
