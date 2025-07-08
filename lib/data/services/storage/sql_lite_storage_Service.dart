import 'dart:convert';
import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'i_storage_service.dart';

class SQLiteStorageService implements IStorageService {
  static const _dbName = 'exam_analyzer.db';
  static const _tableName = 'score_reports';

  static Database? _db;

  Future<Database> get _database async {
    if (_db != null) return _db!;
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, _dbName);
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0,
            data TEXT NOT NULL
          )
        ''');
      },
    );
    return _db!;
  }

  @override
  Future<bool> addScoreReport(ScoreReport report) async {
    final db = await _database;
    final jsonData = jsonEncode(report.toJson());
    final result = await db.insert(_tableName, {'data': jsonData});
    return result > 0;
  }

  @override
  Future<ScoreReport?> fetchScoreReport(int id) async {
    final db = await _database;
    final result = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      final jsonData = jsonDecode(result.first['data'] as String);
      return ScoreReport.fromJson(jsonData);
    }
    return null;
  }

  @override
  Future<List<ScoreReport>> fetchAllScoreReports() async {
    final db = await _database;
    final result = await db.query(_tableName);
    return result.map((row) {
      final jsonData = jsonDecode(row['data'] as String);
      return ScoreReport.fromJson(jsonData);
    }).toList();
  }

  @override
  Future<bool> updateScoreReport(ScoreReport report) async {
    final db = await _database;
    if (report.id == null) return false; // requires identifiable ID

    final jsonData = jsonEncode(report.toJson());
    final result = await db.update(
      _tableName,
      {'data': jsonData},
      where: 'id = ?',
      whereArgs: [report.id],
    );
    return result > 0;
  }

  @override
  Future<bool> deleteScoreReport(int id) async {
    final db = await _database;
    final result = await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result > 0;
  }
}
