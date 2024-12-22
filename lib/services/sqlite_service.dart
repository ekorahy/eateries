
import 'package:eateries/data/model/restaurant.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  static const String _databaseName = 'restaurantlist.db';
  static const String _tableName = 'restaurant';
  static const int _version = 1;

  Future<void> createTable(Database database) async {
    await database.execute("""
    CREATE TABLE $_tableName(
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT,
    description TEXT,
    pictureId TEXT,
    city TEXT,
    rating REAL)
    """);
  }

  Future<Database> _initializeDb() async {
    return openDatabase(_databaseName, version: _version,
        onCreate: (Database database, int version) async {
      await createTable(database);
    });
  }

  Future<int> insertItem(Restaurant profile) async {
    final db = await _initializeDb();

    final data = profile.toJson();
    final id = await db.insert(_tableName, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<Restaurant>> getRestaurants() async {
    final db = await _initializeDb();
    final results = await db.query(_tableName);

    return results.map((result) => Restaurant.fromJson(result)).toList();
  }

  Future<Restaurant> getRestaurantById(String name) async {
    final db = await _initializeDb();
    final results =
        await db.query(_tableName, where: 'name = ?', whereArgs: [name], limit: 1);

    return results.map((result) => Restaurant.fromJson(result)).first;
  }

  Future<int> deleteRestaurant(String name) async {
    final db = await _initializeDb();
    final result = await db.delete(_tableName, where: 'name= ?', whereArgs: [name]);
    return result;
  }
}
