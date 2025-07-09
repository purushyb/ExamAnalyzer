import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/utils/result.dart';

abstract class IScoreReportRepository {
  Future<Result<bool>> add(ScoreReport report);
  Stream<Result<List<ScoreReport>>> get scoreReportsStream;
  Future<Result<ScoreReport?>> get(int id);
  Future<Result<List<ScoreReport>>> getAll();
  Future<Result<bool>> update(ScoreReport report);
  Future<Result<bool>> delete(int id);
  Future<Result<bool>> setNextExamDate(DateTime date);
  Result<DateTime?> getNextExamDate();
  Stream<Result<DateTime?>> get nextExamDateStream;
}
