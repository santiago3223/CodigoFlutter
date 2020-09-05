import 'package:grocerylist/models/list_items.dart';
import 'package:grocerylist/models/shopping_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  int version = 1;
  Database db;

  Future<Database> openDb() async {
    //await deleteDatabase(join(await getDatabasesPath(), 'shopping.db'));
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'shopping.db'),
          onCreate: (database, version) {
        database.execute(
            'CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
        database.execute(
            'CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, name TEXT, quantity TEXT, note TEXT, FOREIGN KEY(idList) REFERENCES lists(id))');
      }, version: version);
    }
    return db;
  }

  Future testDb() async {
    db = await openDb();
    await db.execute('INSERT INTO lists VALUES (0, "Fruta", 2)');
    await db.execute(
        'INSERT INTO items VALUES (0, 0, "Manzanas", "10 Kg", "Rojas")');
    List lists = await db.rawQuery("select * from lists");
    List items = await db.rawQuery("select * from items");
    print(lists[0].toString());
    print(items[0].toString());
  }

  Future<int> insertList(ShoppingList list) async {
    int id = await db.insert("lists", list.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<int> insertItem(ListItem list) async {
    int id = await db.insert("items", list.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<ShoppingList>> getLists() async {
    List<Map<String, dynamic>> maps = await db.query('lists');
    return List.generate(
        maps.length,
        (i) =>
            ShoppingList(maps[i]['id'], maps[i]['name'], maps[i]['priority']));
  }
}
