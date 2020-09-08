import 'package:flutter/material.dart';
import 'package:grocerylist/models/shopping_list.dart';

class ShoppingListDialog {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPriority = TextEditingController();

  Widget buildDialog(BuildContext context, ShoppingList list, bool isNew) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(isNew ? "Nueva Lista" : "Editar lista"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: InputDecoration(hintText: "Nombre de la lista"),
            ),
            TextField(
              controller: txtPriority,
              decoration: InputDecoration(hintText: "Prioridad (1-3)"),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              child: Text("Guardar Lista"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
