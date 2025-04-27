import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static late Database db;

  static Future<void> initDb() async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;

    db = await databaseFactory.openDatabase('app_database.db');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT,
        role TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price REAL,
        stock INTEGER,
        category TEXT
      )
    ''');
  }
}
