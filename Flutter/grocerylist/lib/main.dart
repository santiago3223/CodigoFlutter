import 'package:flutter/material.dart';
import 'package:grocerylist/models/shopping_list.dart';
import 'package:grocerylist/util/dbhelper.dart';

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
      home: GroceryList(),
    );
  }
}

class GroceryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
      ),
      body: ShList(),
    );
  }
}

class ShList extends StatefulWidget {
  @override
  _ShListState createState() => _ShListState();
}

class _ShListState extends State<ShList> {
  DbHelper helper = DbHelper();
  List<ShoppingList> shoppingList;

  Future showData() async {
    await helper.openDb();
    shoppingList = await helper.getLists();
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return ListView.builder(
        itemCount: shoppingList != null ? shoppingList.length : 0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(shoppingList[index].name),
            leading: CircleAvatar(
              child: Text(shoppingList[index].priority.toString()),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
          );
        });
  }
}
