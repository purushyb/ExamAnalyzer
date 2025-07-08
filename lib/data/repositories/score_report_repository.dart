import 'dart:async';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/storage/i_storage_service.dart';
import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';

class ScoreReportRepositoryImpl implements IScoreReportRepository {
  final IStorageService _storage;
  final IUserDefaultsService _userDefaultsService;

  final StreamController<List<ScoreReport>> _controller =
      StreamController<List<ScoreReport>>.broadcast();

  final StreamController<DateTime?> _examDateController =
      StreamController<DateTime?>.broadcast();

  ScoreReportRepositoryImpl(this._storage, this._userDefaultsService) {
    _emitReports(); // emit initial data
  }

  Future _emitReports() async {
    final allReports = await _storage.fetchAllScoreReports();
    _controller.add(allReports);
  }

  void _emitExamDate() {
    final result = _userDefaultsService.getNextExamDate();
    _examDateController.add(result);
  }

  @override
  Stream<List<ScoreReport>> get scoreReportsStream => _controller.stream;
  @override
  Stream<DateTime?> get nextExamDateStream => _examDateController.stream;

  @override
  Future<bool> add(ScoreReport report) async {
    final success = await _storage.addScoreReport(report);
    if (success) _emitReports();
    return success;
  }

  @override
  Future<bool> delete(int id) async {
    final success = await _storage.deleteScoreReport(id);
    if (success) _emitReports();
    return success;
  }

  @override
  Future<ScoreReport?> get(int id) => _storage.fetchScoreReport(id);

  @override
  Future<List<ScoreReport>> getAll() => _storage.fetchAllScoreReports();

  @override
  Future<bool> update(ScoreReport report) async {
    final success = await _storage.updateScoreReport(report);
    if (success) _emitReports();
    return success;
  }

  @override
  DateTime? getNextExamDate() {
    return _userDefaultsService.getNextExamDate(); // ❗️missing return before
  }

  @override
  Future<void> setNextExamDate(DateTime date) async {
    await _userDefaultsService.setNextExamDate(date);
    _emitExamDate();
  }

  void dispose() {
    _controller.close();
  }
}
