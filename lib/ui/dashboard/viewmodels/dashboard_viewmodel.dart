import 'package:exam_analyzer/data/models/score_report.dart';
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

  DashboardViewModel() {
    showLoading();
    _fetchAttempts(shouldNotify: false);
    _fetchNextExamDate(shouldNotify: false);
    _fetchSkillProfileData(shouldNotify: false);
    stopLoading();
  }

  Future _fetchAttempts({bool shouldNotify = true}) async {
    final result = generateDummyScoreReports(12);
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

  //Todo - this should be in local data provider
  List<ScoreReport> generateDummyScoreReports(int count) {
    return List.generate(count, (index) {
      return ScoreReport(
        gseScore: 70 + (index % 10),
        listening: 75 + (index % 5),
        speaking: 65 + (index % 7),
        reading: 72 + (index % 6),
        writing: 68 + (index % 8),
        subskills: List.generate(8, (i) {
          return Subskill(
            subskill: i + 1,
            skills: i < 4 ? 8 : 4,
            name: 'Subskill ${i + 1}',
            description: 'Description ${i + 1}',
            score: 50 + ((index + i) % 50),
            content: '', // empty content as per request
          );
        }),
      );
    });
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
