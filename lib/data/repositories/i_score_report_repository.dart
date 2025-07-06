import 'package:exam_analyzer/data/models/score_report.dart';

abstract class IScoreReportRepository {
  Future<bool> add(ScoreReport report);
  Future<ScoreReport?> get(int id);
  Future<List<ScoreReport>> getAll();
  Future<bool> update(ScoreReport report);
  Future<bool> delete(int id);
}
