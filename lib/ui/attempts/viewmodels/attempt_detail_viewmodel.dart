import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/data/utils/ux_simplification_utils.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:exam_analyzer/ui/utils/data_convertion_utils.dart';

class AttemptDetailViewmodel extends BaseViewModel {
  late ScoreReport _attempt;

  int? _currentReportId;

  String _readbleDateFormat = "";
  String get readbleDateFormat => _readbleDateFormat;

  String _overallScore = "";
  String get overallScore => _overallScore;

  List<Subskill> _subSkills = [];
  List<Subskill> get subSkills => _subSkills;

  List<Subskill> _mainSkills = [];
  List<Subskill> get mainSkills => _mainSkills;

  final IScoreReportRepository _repository;
  final AppLocalization _localization;
  final INavigationService _navigationService;
  AttemptDetailViewmodel(
    int attemptId,
    this._repository,
    this._localization,
    this._navigationService,
  ) {
    _currentReportId = attemptId;
    init();
  }
  @override
  Future init() async {
    showLoading();
    if (_currentReportId != null) {
      await Future.wait([
        _fetchAttempts(attemptId: _currentReportId!, shouldNotify: false),
      ]).then((value) {
        stopLoading();
      });
    }
  }

  Future _fetchAttempts({
    required int attemptId,
    bool shouldNotify = true,
  }) async {
    var result = await _repository.get(attemptId);
    if (result.isSuccess) {
      _attempt = result.data!;
      _overallScore = _attempt.gseScore.toString();
      _mainSkills = DataConvertionUtils.mainSkillsToSubSkills(
        _attempt,
        _localization,
      );
      _subSkills = _attempt.subskills;
      _readbleDateFormat = _attempt.date.readableDate();
      notifyChanges(shouldNotify: shouldNotify);
    } else {
      setError(result.error);
    }
  }

  Future deleteAttempt() async {
    showLoading();
    if (_currentReportId != null) {
      await _repository.delete(_currentReportId!);
    }
    _navigationService.goBack();
  }
}
