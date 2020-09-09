import 'package:controlTareas/models/subtask.dart';
import 'package:controlTareas/models/task.dart';
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
        'INSERT INTO tasks VALUES ( null, "Programar", "Muy Urgente", 0)');
    List items = await db.rawQuery("select * from tasks");
    print(items[0].toString());
  }

  Future<List<Task>> getTasks() async {
    List<Map<String, dynamic>> maps = await db.query("tasks");
    return List.generate(
      maps.length,
      (index) => Task(maps[index]["id"], maps[index]["name"],
          maps[index]["priority"], maps[index]["status"]),
    );
  }

  Future<int> insertSubTask(SubTask subTask, int idTask) async {
    int id = await db.insert("subtasks", values);
    return id;
  }
}
