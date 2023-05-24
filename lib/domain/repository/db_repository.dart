import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter/domain/models/db_model.dart';

abstract class DbRepository {
  Future<Database> create();
  Future<void> insertData(
    String title,
    String description,
  );
  Future<List<DbModel>> getData();

  Future<void> deleteData(int id);
}
