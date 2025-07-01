import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/analytics_line_chart_widget.dart';
import 'package:exam_analyzer/ui/core/ui/analytics_tile_widget.dart';
import 'package:exam_analyzer/ui/core/ui/skill_profile_data_table_widget.dart';
import 'package:provider/provider.dart';

import '../viewmodels/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder:
          (context, viewmodel, child) => SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnalyticsTileWidget(
                      name: AppLocalization.of(context).attempts,
                      value: viewmodel.attemptsCount,
                    ),
                    AnalyticsTileWidget(
                      name: AppLocalization.of(context).examDate,
                      value: viewmodel.nextExamDate,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                AnalyticsLineChart(lineChartData: viewmodel.lineChartData),
                SizedBox(height: 16),
                SkillProfileDataTableWidget(reports: viewmodel.report),
              ],
            ),
          ),
    );
  }
}
