import 'dart:async';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/logging_service/i_logging_service.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:logger/web.dart';

class DashboardViewModel extends BaseViewModel {
  List<ScoreReport> _reports = [];
  List<ScoreReport> get report => _reports;

  String _attemtCount = "";
  String get attemptsCount => _attemtCount;

  String? _nextExamDate;
  String? get nextExamDate => _nextExamDate;

  List<List<FlSpot>> _lineChartData = [];
  List<List<FlSpot>> get lineChartData => _lineChartData;

  final IScoreReportRepository _repository;
  final INavigationService _navigationService;
  late final StreamSubscription<List<ScoreReport>> _subscription;
  late final StreamSubscription<DateTime?> _nextExamDatesubscription;
  final ILoggingService _logger;
  DashboardViewModel({
    required IScoreReportRepository repository,
    required INavigationService navigationService,
    required IUserDefaultsService userDefaultsService,
    required ILoggingService logger,
  }) : _repository = repository,
       _navigationService = navigationService,
       _logger = logger {
    init();
  }

  @override
  Future init() async {
    showLoading();
    await Future.wait([_fetchAttempts(), _fetchNextExamDate()]);
    stopLoading();
  }

  Future _fetchAttempts() async {
    _subscription = _repository.scoreReportsStream.listen((data) {
      _reports = data;
      _logger.info(_reports.toString());
      _attemtCount = _reports.length.toString();
      _fetchSkillProfileData();
      notifyChanges();
    });
  }

  Future _fetchNextExamDate() async {
    _nextExamDatesubscription = _repository.nextExamDateStream.listen((date) {
      if (date != null) {
        _nextExamDate = DateFormat.yMMMEd().format(date);
        notifyChanges();
      }
    });
  }

  Future _fetchSkillProfileData() async {
    _lineChartData = ChartUtils.convertToFlSpotSeries(_reports);
  }

  void goToAttemptsListScreen() {
    _navigationService.goToAttemptsListScreen();
  }

  void goToNextExamDateSceen() {
    _navigationService.goToNextExamDateScreen();
  }

  @override
  void dispose() {
    _subscription.cancel();
    _nextExamDatesubscription.cancel();
    super.dispose();
  }
}
