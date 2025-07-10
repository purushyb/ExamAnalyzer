import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/analytics_line_chart_widget.dart';
import 'package:exam_analyzer/ui/core/ui/data_tile_widget.dart';
import 'package:exam_analyzer/ui/core/ui/padded_scaffold.dart';
import 'package:exam_analyzer/ui/dashboard/widgets/skill_profile_data_table_widget.dart';
import 'package:exam_analyzer/ui/dashboard/widgets/sub_skill_table_widget.dart';

import '../viewmodels/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScaffold<DashboardViewModel>(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).dashboardScreenTitle),
      ),
      childBuilder: (viewModel) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DataTileWidget(
                    name: AppLocalization.of(context).attempts,
                    value: viewModel.attemptsCount,
                    onPressed: () {
                      viewModel.goToAttemptsListScreen();
                    },
                  ),
                  DataTileWidget(
                    name: AppLocalization.of(context).examDate,
                    value: viewModel.nextExamDate,
                    onPressed: () {
                      viewModel.goToNextExamDateSceen();
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              SkillProfileAnalyticsWidget(
                chart: AnalyticsLineChart(
                  lineChartData: viewModel.lineChartData,
                ),
                table: SkillProfileDataTableWidget(reports: viewModel.report),
              ),
              SizedBox(height: 16),
              SubskillTableWidget(reports: viewModel.report),
            ],
          ),
        );
      },
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
