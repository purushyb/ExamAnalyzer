import 'dart:convert';
import 'dart:io';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:exam_analyzer/ui/utils/data_convertion_utils.dart';

class AddAttemptViewmodel extends BaseViewModel {
  DateTime? _date;
  DateTime? get date => _date;

  ScoreReport? _report;
  List<Subskill> _mainSkills = [];
  List<Subskill> get mainSkills => _mainSkills;

  final IScoreReportRepository _repository;
  final AppLocalization _localization;
  final INavigationService _navigationService;

  AddAttemptViewmodel(
    this._repository,
    this._localization,
    this._navigationService,
  );

  Future parseReport(String path) async {
    final jsonString = await File(path).readAsString();
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    if (date != null) {
      jsonMap['date'] = date?.toIso8601String();
    }

    _report = ScoreReport.fromJson(jsonMap);
    _mainSkills = DataConvertionUtils.mainSkillsToSubSkills(
      _report!,
      _localization,
      showOverall: true,
    );
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

  @override
  Future<void> init() async {
    // Not needed
  }
}
