import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardViewModel extends ChangeNotifier {
  List<ScoreReport> _reports = [];
  List<ScoreReport> get report => _reports;

  String _attemtCount = "";
  String get attemptsCount => _attemtCount;

  String _nextExamDate = "";
  String get nextExamDate => _nextExamDate;

  List<List<FlSpot>> _lineChartData = [];
  List<List<FlSpot>> get lineChartData => _lineChartData;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final IScoreReportRepository _repository;

  DashboardViewModel({required IScoreReportRepository repository})
    : _repository = repository {
    init();
  }

  Future init() async {
    showLoading();
    await Future.wait([
      _fetchAttempts(shouldNotify: false),
      _fetchNextExamDate(shouldNotify: false),
      _fetchSkillProfileData(shouldNotify: false),
    ]);
    stopLoading();
  }

  Future _fetchAttempts({bool shouldNotify = true}) async {
    final result = await _repository.getAll();
    _reports = result;
    _attemtCount = _reports.length.toString();
    notifyChanges(shouldNotify: shouldNotify);
  }

  Future _fetchNextExamDate({bool shouldNotify = true}) async {
    final result = DateTime.now();
    _nextExamDate = DateFormat.yMMMEd().format(result);
    notifyChanges(shouldNotify: shouldNotify);
  }

  Future _fetchSkillProfileData({bool shouldNotify = true}) async {
    _lineChartData = convertToFlSpotSeries(_reports);
    notifyChanges(shouldNotify: shouldNotify);
  }

  void showLoading() {
    _isLoading = true;
    notifyChanges();
  }

  void stopLoading() {
    _isLoading = false;
    notifyChanges();
  }

  void notifyChanges({bool shouldNotify = true}) {
    if (shouldNotify) notifyListeners();
  }

  List<List<FlSpot>> convertToFlSpotSeries(List<ScoreReport> reports) {
    final List<FlSpot> listeningPoints = [];
    final List<FlSpot> speakingPoints = [];
    final List<FlSpot> readingPoints = [];
    final List<FlSpot> writingPoints = [];
    final List<FlSpot> gsePoints = [];

    for (int i = 0; i < reports.length; i++) {
      final report = reports[i];
      listeningPoints.add(FlSpot(i.toDouble(), report.listening.toDouble()));
      speakingPoints.add(FlSpot(i.toDouble(), report.speaking.toDouble()));
      readingPoints.add(FlSpot(i.toDouble(), report.reading.toDouble()));
      writingPoints.add(FlSpot(i.toDouble(), report.writing.toDouble()));
      gsePoints.add(FlSpot(i.toDouble(), report.gseScore.toDouble()));
    }

    return [
      listeningPoints,
      speakingPoints,
      readingPoints,
      writingPoints,
      gsePoints,
    ];
  }
}
