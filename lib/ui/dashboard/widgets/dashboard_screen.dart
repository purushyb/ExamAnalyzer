import 'package:exam_analyzer/routing/routes.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/analytics_line_chart_widget.dart';
import 'package:exam_analyzer/ui/core/ui/analytics_tile_widget.dart';
import 'package:exam_analyzer/ui/dashboard/widgets/skill_profile_data_table_widget.dart';
import 'package:exam_analyzer/ui/dashboard/widgets/sub_skill_table_widget.dart';
import 'package:go_router/go_router.dart';
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
                      onPressed: () {
                        context.push(Routes.attempts);
                      },
                    ),
                    AnalyticsTileWidget(
                      name: AppLocalization.of(context).examDate,
                      value: viewmodel.nextExamDate,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SkillProfileAnalyticsWidget(
                  chart: AnalyticsLineChart(
                    lineChartData: viewmodel.lineChartData,
                  ),
                  table: SkillProfileDataTableWidget(reports: viewmodel.report),
                ),
                SizedBox(height: 16),
                SubskillTableWidget(reports: viewmodel.report),
              ],
            ),
          ),
    );
  }
}

class SkillProfileAnalyticsWidget extends StatefulWidget {
  const SkillProfileAnalyticsWidget({
    super.key,
    required this.chart,
    required this.table,
  });

  final AnalyticsLineChart chart;
  final SkillProfileDataTableWidget table;

  @override
  State<SkillProfileAnalyticsWidget> createState() =>
      _SkillProfileAnalyticsWidgetState();
}

class _SkillProfileAnalyticsWidgetState
    extends State<SkillProfileAnalyticsWidget> {
  bool isToggled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Switch(
          value: isToggled,
          onChanged: (value) {
            setState(() {
              isToggled = !isToggled;
            });
          },
        ),
        isToggled ? widget.chart : widget.table,
      ],
    );
  }
}
