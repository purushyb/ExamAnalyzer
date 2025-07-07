import 'dart:convert';
import 'dart:io';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';

class AddAttemptViewmodel extends BaseViewModel {
  DateTime? _date;
  DateTime? get date => _date;

  ScoreReport? _report;
  ScoreReport? get report => _report;

  final IScoreReportRepository _repository;
  final AppLocalization _localization;
  final INavigationService _navigationService;

  AddAttemptViewmodel({
    required IScoreReportRepository repository,
    required AppLocalization localization,
    required INavigationService navigationService,
  }) : _repository = repository,
       _localization = localization,
       _navigationService = navigationService;

  Future parseReport(String path) async {
    final jsonString = await File(path).readAsString();
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    if (date != null) {
      jsonMap['date'] = date?.toIso8601String();
    }

    _report = ScoreReport.fromJson(jsonMap);
    notifyChanges();
  }

  void selectDate(DateTime date) {
    _date = date;
    notifyChanges();
  }

  Future addAttempt() async {
    if (_report != null) {
      await _repository.add(_report!);
      _navigationService.goBack();
    } else {
      setError(_localization.somethingWentWrong);
    }
  }
}
