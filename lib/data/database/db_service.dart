import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter/domain/models/db_model.dart';
import 'package:sqlite_flutter/domain/repository/db_repository.dart';

class DbService extends DbRepository {
  @override
  Future<Database> create() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, 'test.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE my_table(id INTEGER PRIMARY KEY, title TEXT, description TEXT )',
        );
      },
    );
  }

  @override
  Future<void> insertData(
    String title,
    String description,
  ) async {
    final db = await create();
    await db.insert(
      'my_table',
      {
        'title': title,
        'description': description,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<DbModel>> getData() async {
    final db = await create();
    final data = await db.query('my_table');
    List<DbModel> dbModel = data.map((item) => DbModel.fromJson(item)).toList();
    return dbModel;
  }

  @override
  Future<void> deleteData(int id) async {
    final db = await create();
    await db.delete(
      'my_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
