import 'package:sqlite_flutter/domain/models/db_model.dart';
import 'package:sqlite_flutter/domain/repository/db_repository.dart';

class DbUsecase {
  final DbRepository _dbRepository;

  DbUsecase(this._dbRepository);

  Future<void> create() async {
    await _dbRepository.create();
  }

  Future<void> insertData(
    String title,
    String description,
  ) async {
    await _dbRepository.insertData(title, description);
  }

  Future<List<DbModel>> getData() async {
    return await _dbRepository.getData();
  }

  Future<void> deleteData(int id) async {
    await _dbRepository.deleteData(id);
  }
}
