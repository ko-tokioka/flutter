import 'dart:io';
import 'package:my_app/models/todo.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  // Private Constructor
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static final String _tableName = 'Todo';
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'TodoDB.db');

    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    return await db.execute(
      "CREATE TABLE Todo("
      "id TEXT PRIMARY KEY,"
      "title TEXT"
      "dueDate TEXT"
      "note TEXT"
      ")"
    );
  }

  dynamic createTodo(Todo todo) async {
    final db = await database;
    return await db.insert(_tableName, todo.toMap());
  }
}