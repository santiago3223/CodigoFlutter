import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  int version = 1;
  Database db;

  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'tasks.db'),
          onCreate: (database, version) {
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, priority TEXT, state INTEGER)');
        database.execute(
            'CREATE TABLE subtasks(id INTEGER PRIMARY KEY, idTask INTEGER, name TEXT, priority TEXT, state INTEGER, FOREIGN KEY(idTask) REFERENCES tasks(id))');
      }, version: version);
    }
    return db;
  }

  Future testDb() async {
    db = await openDb();
    await db.execute(
        'INSERT INTO tasks VALUES ( 0, "Programar", "Muy Urgente", 0)');
    List items = await db.rawQuery("select * from tasks");
    print(items[0].toString());
  }
}
