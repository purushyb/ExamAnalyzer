import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/AnalyticsLineChart.dart';
import 'package:exam_analyzer/ui/core/ui/AnalyticsTileWidget.dart';
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
                AnalyticsLineChart(),
                SizedBox(height: 16),
                AnalyticsLineChart(),
              ],
            ),
          ),
    );
  }
}
