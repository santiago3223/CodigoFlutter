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

  Future<List<Task>> getTasks(int state) async {
    List<Map<String, dynamic>> maps =
        await db.query("tasks", where: "state=?", whereArgs: [state]);
    return List.generate(
      maps.length,
      (index) => Task(maps[index]["id"], maps[index]["name"],
          maps[index]["priority"], maps[index]["state"]),
    );
  }

  Future<List<SubTask>> getSubTasks(int idTask) async {
    List<Map<String, dynamic>> maps =
        await db.query("subtasks", where: "idTask=?", whereArgs: [idTask]);
    return List.generate(
      maps.length,
      (index) => SubTask(maps[index]["id"], maps[index]["name"],
          maps[index]["priority"], maps[index]["state"]),
    );
  }

  Future<int> insertSubTask(SubTask subTask, int idTask) async {
    int id = await db.insert("subtasks", subTask.toMap(idTask),
        conflictAlgorithm: ConflictAlgorithm.replace);

    List<Map<String, dynamic>> maps =
        await db.query("tasks", where: "id=?", whereArgs: [idTask]);
    Task t = Task(
        maps[0]["id"], maps[0]["name"], maps[0]["priority"], maps[0]["state"]);
    t.state = 1;
    await insertTask(t);
    /*
    List<Map<String, dynamic>> subtareas = await db.query("subtasks",
        where: "idTask=? AND state=?", whereArgs: [idTask, 1]);
    if (subtareas.length > 0) {
      t.state = 1;
    }*/
    return id;
  }

  Future<int> insertTask(Task task) async {
    int id = await db.insert("tasks", task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }
}
