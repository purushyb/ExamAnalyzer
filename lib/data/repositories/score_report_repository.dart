import 'dart:async';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/logging_service/i_logging_service.dart';
import 'package:exam_analyzer/data/services/storage/i_storage_service.dart';
import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';
import 'package:exam_analyzer/data/utils/result.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';

class ScoreReportRepositoryImpl implements IScoreReportRepository {
  final IStorageService _storage;
  final IUserDefaultsService _userDefaultsService;
  final AppLocalization _localization;
  final ILoggingService _logger;

  final _reportController =
      StreamController<Result<List<ScoreReport>>>.broadcast();
  final _examDateController = StreamController<Result<DateTime?>>.broadcast();

  ScoreReportRepositoryImpl(
    this._storage,
    this._userDefaultsService,
    this._localization,
    this._logger,
  ) {
    _emitReports();
    _emitExamDate();
  }

  void _emitReports() async {
    try {
      final reports = await _storage.fetchAllScoreReports();
      _reportController.add(Result.success(reports));
    } catch (e) {
      _logger.error(e: e);
      _reportController.add(Result.failure(_localization.reportsErrorMsg));
    }
  }

  void _emitExamDate() {
    try {
      final date = _userDefaultsService.getNextExamDate();
      _examDateController.add(Result.success(date));
    } catch (e) {
      _logger.error(e: e);
      _examDateController.add(Result.failure(_localization.examDateErrorMsg));
    }
  }

  @override
  Stream<Result<List<ScoreReport>>> get scoreReportsStream =>
      _reportController.stream;

  @override
  Stream<Result<DateTime?>> get nextExamDateStream =>
      _examDateController.stream;

  @override
  Future<Result<bool>> add(ScoreReport report) async {
    try {
      final success = await _storage.addScoreReport(report);
      if (success) _emitReports();
      return Result.success(success);
    } catch (e) {
      _logger.error(e: e);
      return Result.failure(_localization.addReportErrorMsg);
    }
  }

  @override
  Future<Result<bool>> delete(int id) async {
    try {
      final success = await _storage.deleteScoreReport(id);
      if (success) _emitReports();
      return Result.success(success);
    } catch (e) {
      _logger.error(e: e);
      return Result.failure(_localization.deleteReportErrorMsg);
    }
  }

  @override
  Future<Result<ScoreReport?>> get(int id) async {
    try {
      final report = await _storage.fetchScoreReport(id);
      return Result.success(report);
    } catch (e) {
      _logger.error(e: e);
      return Result.failure(_localization.reportErrorMsg);
    }
  }

  @override
  Future<Result<List<ScoreReport>>> getAll() async {
    try {
      final reports = await _storage.fetchAllScoreReports();
      return Result.success(reports);
    } catch (e) {
      _logger.error(e: e);
      return Result.failure(_localization.reportsErrorMsg);
    }
  }

  @override
  Future<Result<bool>> update(ScoreReport report) async {
    try {
      final success = await _storage.updateScoreReport(report);
      if (success) _emitReports();
      return Result.success(success);
    } catch (e) {
      _logger.error(e: e);
      return Result.failure(_localization.updateReportErrorMsg);
    }
  }

  @override
  Result<DateTime?> getNextExamDate() {
    try {
      final date = _userDefaultsService.getNextExamDate();
      return Result.success(date);
    } catch (e) {
      _logger.error(e: e);
      return Result.failure(_localization.examDateErrorMsg);
    }
  }

  @override
  Future<Result<bool>> setNextExamDate(DateTime date) async {
    try {
      await _userDefaultsService.setNextExamDate(date);
      _emitExamDate();
      return Result.success(true);
    } catch (e) {
      _logger.error(e: e);
      return Result.failure(_localization.addExamDateErrorMsg);
    }
  }

  void dispose() {
    _reportController.close();
    _examDateController.close();
  }
}
