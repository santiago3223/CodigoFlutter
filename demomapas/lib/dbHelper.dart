import 'package:demomapas/place.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
      db = await openDatabase(join(await getDatabasesPath(), 'map.db'),
          onCreate: (db, version) {
        db.execute(
            "CREATE TABLE places (ID INTEGER PRIMARY KEY, name TEXT, lat DOUBLE, lon DOUBLE, image TEXT)");
      }, version: version);
    }
    return db;
  }

  Future insertTestData() async {
    db = await openDb();
    await db.execute(
        'INSERT INTO places VALUES  (1, "Prueba Santiago ", "-16.3740115", "-71.554834", "" )');
    List places = await db.rawQuery("select * from places");
    print(places[0].toString());
  }

  Future<List<Place>> getPlaces() async {
    List<Map<String, dynamic>> maps = await db.query('places');
    List<Place> places = List.generate(
        maps.length,
        (index) => Place(maps[index]["id"], maps[index]["name"],
            maps[index]["lat"], maps[index]["lon"], maps[index]["image"]));

    return places;
  }

  Future<int> insertPlace(Place place) async {
    int id = await db.insert('places', place.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(id);
    return id;
  }
}
