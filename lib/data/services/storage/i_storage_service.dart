import 'package:exam_analyzer/data/models/score_report.dart';

abstract class IStorageService {
  Future<bool> addScoreReport(ScoreReport report);

  Future<ScoreReport?> fetchScoreReport(int id);
  Future<List<ScoreReport>> fetchAllScoreReports();

  Future<bool> updateScoreReport(ScoreReport report);

  Future<bool> deleteScoreReport(int id);
}
