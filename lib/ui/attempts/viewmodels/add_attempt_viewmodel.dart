import 'dart:convert';
import 'dart:io';

import 'package:exam_analyzer/data/enums/main_skills_enum.dart';
import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:exam_analyzer/ui/utils/data_converstion_utils.dart';

class AddAttemptViewmodel extends BaseViewModel {
  ScoreReport? _report;

  DateTime? _date;
  DateTime? get date => _date;

  DateTime get startDate => DateTime(2020);
  DateTime get endDate => DateTime.now();

  int _overallScore = 0;
  int _speakingScore = 0;
  int _readingScore = 0;
  int _writingScore = 0;
  int _listeningScore = 0;

  List<Subskill> _mainSkills = [];
  List<Subskill> get mainSkills => _mainSkills;

  bool _isManualSkillAddition = false;
  bool get isManualSkillAddition => _isManualSkillAddition;

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
    _mainSkills = DataConverstionUtils.mainSkillsToSubSkills(
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
    if (_date == null) {
      setError(_localization.dateNotAssignedError);
      return;
    }
    if (_isManualSkillAddition) {
      _report = ScoreReport(
        gseScore: _overallScore,
        listening: _listeningScore,
        speaking: _speakingScore,
        reading: _readingScore,
        writing: _writingScore,
        subskills: [],
        date: _date!,
      );
    }
    if (_report != null) {
      await _repository.add(_report!);
      _navigationService.goBack();
    } else {
      setError(_localization.somethingWentWrong);
    }
  }

  void toggleSkillAddition(bool isSelected) {
    _isManualSkillAddition = isSelected;
    notifyChanges();
  }

  void updateScore(String score, MainSkillsEnum type) {
    final scoreInt = int.tryParse(score) ?? 0;
    switch (type) {
      case MainSkillsEnum.overall:
        _overallScore = scoreInt;
        break;
      case MainSkillsEnum.speaking:
        _speakingScore = scoreInt;
        break;
      case MainSkillsEnum.reading:
        _readingScore = scoreInt;
        break;
      case MainSkillsEnum.writing:
        _writingScore = scoreInt;
        break;
      case MainSkillsEnum.listening:
        _listeningScore = scoreInt;
        break;
    }
  }

  @override
  Future<void> init() async {
    // Not needed
  }
}
