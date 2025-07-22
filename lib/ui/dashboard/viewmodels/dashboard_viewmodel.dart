import 'dart:async';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/repositories/i_tools_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/data/utils/result.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class DashboardViewModel extends BaseViewModel {
  List<ScoreReport> _attempts = [];
  List<ScoreReport> get attempts => _attempts;

  String _attemptsCount = "";
  String get attemptsCount => _attemptsCount;

  String? _nextExamDate;
  String? get nextExamDate => _nextExamDate;

  List<List<FlSpot>> _mainSkillsLineChartData = [];
  List<List<FlSpot>> get mainSkillsLineChartData => _mainSkillsLineChartData;

  late final StreamSubscription<Result<List<ScoreReport>>> _subscription;
  late final StreamSubscription<Result<DateTime?>> _nextExamDatesubscription;

  final IScoreReportRepository _repository;
  final IToolsRepository _toolsRepository;
  final INavigationService _navigationService;
  DashboardViewModel(
    this._repository,
    this._navigationService,
    this._toolsRepository,
  ) {
    init();
  }

  @override
  Future init() async {
    showLoading();
    await Future.wait([
      _fetchAttempts(),
      _fetchNextExamDate(),
    ]).then((value) => stopLoading());
  }

  Future _fetchAttempts() async {
    _subscription = _repository.scoreReportsStream.listen((result) {
      showAttemptsData(result);
    });
    final result = await _repository.getAll();
    showAttemptsData(result);
  }

  void showAttemptsData(Result<List<ScoreReport>> result) {
    if (result.isSuccess) {
      _attempts = result.data!;
      _attemptsCount = _attempts.length.toString();
      _fetchSkillProfileData();
      notifyChanges();
    } else {
      setError(result.error);
    }
  }

  Future _fetchNextExamDate() async {
    _nextExamDatesubscription = _repository.nextExamDateStream.listen((result) {
      if (result.isSuccess) {
        _nextExamDate = DateFormat.yMMMEd().format(result.data!);
        notifyChanges();
      } else {
        setError(result.error);
      }
    });
  }

  Future _fetchSkillProfileData() async {
    _mainSkillsLineChartData = ChartUtils.convertToFlSpotSeries(_attempts);
  }

  void goToAttemptsListScreen() {
    _navigationService.goToAttemptsListScreen();
  }

  void goToNextExamDateSceen() {
    _navigationService.goToNextExamDateScreen();
  }

  Future openNotes() async {
    final result = await _toolsRepository.openNotesLink();
    if (result.isFailure) {
      setError(result.error);
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    _nextExamDatesubscription.cancel();
    super.dispose();
  }
}
