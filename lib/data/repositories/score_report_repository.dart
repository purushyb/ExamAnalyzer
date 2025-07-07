import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/storage/i_storage_service.dart';
import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';

class ScoreReportRepositoryImpl implements IScoreReportRepository {
  final IStorageService _storage;
  final IUserDefaultsService _userDefaultsService;

  ScoreReportRepositoryImpl(this._storage, this._userDefaultsService);

  @override
  Future<bool> add(ScoreReport report) => _storage.addScoreReport(report);

  @override
  Future<bool> delete(int id) => _storage.deleteScoreReport(id);

  @override
  Future<ScoreReport?> get(int id) => _storage.fetchScoreReport(id);

  @override
  Future<List<ScoreReport>> getAll() => _storage.fetchAllScoreReports();

  @override
  Future<bool> update(ScoreReport report) => _storage.updateScoreReport(report);

  @override
  DateTime? getNextExamDate() {
    _userDefaultsService.getNextExamDate();
  }

  @override
  Future<void> setNextExamDate(DateTime date) async {
    await _userDefaultsService.setNextExamDate(date);
  }
}
