import 'dart:async';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/data/utils/result.dart';
import 'package:exam_analyzer/routing/models/full_screen_page_data.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:fl_chart/fl_chart.dart';

class ModuleMainSkillsLineChartViewmodel extends BaseViewModel {
  List<List<FlSpot>> _mainSkillsLineChartData = [];
  List<List<FlSpot>> get mainSkillsLineChartData => _mainSkillsLineChartData;

  late final StreamSubscription<Result<List<ScoreReport>>> _subscription;

  final IScoreReportRepository _repository;
  final INavigationService _navigationService;
  ModuleMainSkillsLineChartViewmodel(
    this._repository,
    this._navigationService,
  ) {
    init();
  }

  @override
  Future<void> init() async {
    await _fetchAttempts();
  }

  Future _fetchAttempts() async {
    _subscription = _repository.scoreReportsStream.listen((result) {
      _showAttemptsData(result);
    });
    final result = await _repository.getAll();
    _showAttemptsData(result);
  }

  void _showAttemptsData(Result<List<ScoreReport>> result) {
    if (result.isSuccess) {
      _mainSkillsLineChartData = ChartUtils.convertToFlSpotSeries(result.data!);
      notifyChanges();
    } else {
      setError(result.error);
    }
  }

  void showInFullScreen(FullScreenPageData data) {
    _navigationService.goToFullScreenPage(data: data);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
