import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class DashboardViewModel extends BaseViewModel {
  final List<ScoreReport> _reports = [];
  List<ScoreReport> get report => _reports;

  String _attemtCount = "";
  String get attemptsCount => _attemtCount;

  String _nextExamDate = "";
  String get nextExamDate => _nextExamDate;

  List<List<FlSpot>> _lineChartData = [];
  List<List<FlSpot>> get lineChartData => _lineChartData;

  final IScoreReportRepository _repository;
  final INavigationService _navigationService;

  DashboardViewModel({
    required IScoreReportRepository repository,
    required INavigationService navigationService,
  }) : _repository = repository,
       _navigationService = navigationService {
    init();
  }

  Future init() async {
    showLoading();
    await Future.wait([
      _fetchAttempts(shouldNotify: false),
      _fetchNextExamDate(shouldNotify: false),
    ]);
    // reports needs to fetched before this ops
    await _fetchSkillProfileData(shouldNotify: false);
    stopLoading();
  }

  Future _fetchAttempts({bool shouldNotify = true}) async {
    final result = await _repository.getAll();
    _reports.addAll(result);
    _attemtCount = _reports.length.toString();
    notifyChanges(shouldNotify: shouldNotify);
  }

  Future _fetchNextExamDate({bool shouldNotify = true}) async {
    final result = DateTime.now();
    _nextExamDate = DateFormat.yMMMEd().format(result);
    notifyChanges(shouldNotify: shouldNotify);
  }

  Future _fetchSkillProfileData({bool shouldNotify = true}) async {
    _lineChartData = ChartUtils.convertToFlSpotSeries(_reports);
    notifyChanges(shouldNotify: shouldNotify);
  }

  void goToAttemptsListScreen() {
    _navigationService.goToAttemptsListScreen();
  }
}
