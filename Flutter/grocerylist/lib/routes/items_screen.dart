import 'package:flutter/material.dart';
import 'package:grocerylist/models/list_items.dart';
import 'package:grocerylist/models/shopping_list.dart';
import 'package:grocerylist/util/dbhelper.dart';

class ItemsScreen extends StatefulWidget {
  final ShoppingList shoppingList;

  ItemsScreen(this.shoppingList);

  @override
  _ItemsScreenState createState() => _ItemsScreenState(shoppingList);
}

class _ItemsScreenState extends State<ItemsScreen> {
  ShoppingList shoppingList;
  _ItemsScreenState(this.shoppingList);

  DbHelper helper = DbHelper();
  List<ListItem> listItems;

  Future showData() async {
    print("muestra items");
    await helper.openDb();
    listItems = await helper.getItems(shoppingList.id);
    setState(() {
      listItems = listItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      appBar: AppBar(
        title: Text(shoppingList.name),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () async {
              await helper.insertItem(ListItem(
                  0, shoppingList.id, "Item Agreado Boton", "10kg", "obs"));
              showData();
            },
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listItems != null ? listItems.length : 0,
                itemBuilder: (c, i) {
                  return ListTile(
                    title: Text(listItems[i].name),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
