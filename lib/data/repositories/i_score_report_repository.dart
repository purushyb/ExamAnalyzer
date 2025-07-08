import 'package:exam_analyzer/data/models/score_report.dart';

abstract class IScoreReportRepository {
  Future<bool> add(ScoreReport report);
  Stream<List<ScoreReport>> get scoreReportsStream;
  Future<ScoreReport?> get(int id);
  Future<List<ScoreReport>> getAll();
  Future<bool> update(ScoreReport report);
  Future<bool> delete(int id);
  Future<void> setNextExamDate(DateTime date);
  DateTime? getNextExamDate();
  Stream<DateTime?> get nextExamDateStream;
}
