import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_toggle_switch_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_tools_tile_widget.dart';
import 'package:exam_analyzer/ui/core/ui/reusables/analytics_line_chart_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_data_tile_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:exam_analyzer/ui/dashboard/widgets/skill_profile_data_table_widget.dart';
import 'package:exam_analyzer/ui/dashboard/widgets/sub_skill_table_widget.dart';

import '../viewmodels/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      appBarBuilder:
          (viewModel) => AppBar(
            title: Text(AppLocalization.of(context).dashboardScreenTitle),
          ),
      childBuilder: (viewModel) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AnalyticsTopWidget(
                attemptsCount: viewModel.attemptsCount,
                nextExamDate: viewModel.nextExamDate,
                onAttemptsCountSelected: viewModel.goToAttemptsListScreen,
                onExamDateSelected: viewModel.goToNextExamDateSceen,
              ),
              ToolsWidget(
                onClickedAddNotes: viewModel.goToAddNotes,
                onClickDND: viewModel.toggleDND,
                onClickVoiceTools: viewModel.goToVoiceTools,
              ),
              MainSkillsAnalyticsWidget(
                chart: AnalyticsLineChart(
                  lineChartData: viewModel.lineChartData,
                ),
                table: SkillProfileDataTableWidget(reports: viewModel.report),
              ),
              SubskillTableWidget(reports: viewModel.report),
            ],
          ),
        );
      },
      fabBuilder:
          (viewModel) => FloatingActionButton(
            onPressed: viewModel.openNotes,
            child: Icon(Icons.edit_document),
          ),
    );
  }
}

class ToolsWidget extends StatelessWidget {
  const ToolsWidget({
    super.key,
    required this.onClickedAddNotes,
    required this.onClickDND,
    required this.onClickVoiceTools,
  });

  final Function() onClickedAddNotes;
  final Function() onClickVoiceTools;
  final Function() onClickDND;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseToolsTileWidget(
          name: AppLocalization.of(context).checkPitchTitle,
          iconData: Icons.graphic_eq,
          onPressed: onClickVoiceTools,
        ),
        BaseToolsTileWidget(
          name: AppLocalization.of(context).dndTitle,
          iconData: Icons.do_not_disturb,
          onPressed: onClickDND,
        ),
        BaseToolsTileWidget(
          name: AppLocalization.of(context).addNotesTitle,
          iconData: Icons.note_outlined,
          onPressed: onClickedAddNotes,
        ),
      ],
    );
  }
}

class AnalyticsTopWidget extends StatelessWidget {
  const AnalyticsTopWidget({
    super.key,
    required this.attemptsCount,
    this.nextExamDate,
    required this.onAttemptsCountSelected,
    required this.onExamDateSelected,
  });

  final String attemptsCount;
  final String? nextExamDate;
  final Function() onAttemptsCountSelected;
  final Function() onExamDateSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseDataTileWidget(
          name: AppLocalization.of(context).attemptsTitle,
          value: attemptsCount,
          onPressed: onAttemptsCountSelected,
        ),
        BaseDataTileWidget(
          name: AppLocalization.of(context).examDateTitle,
          value: nextExamDate,
          onPressed: onExamDateSelected,
        ),
      ],
    );
  }
}

class MainSkillsAnalyticsWidget extends StatefulWidget {
  const MainSkillsAnalyticsWidget({
    super.key,
    required this.chart,
    required this.table,
  });

  final AnalyticsLineChart chart;
  final SkillProfileDataTableWidget table;

  @override
  State<MainSkillsAnalyticsWidget> createState() =>
      _MainSkillsAnalyticsWidgetState();
}

class _MainSkillsAnalyticsWidgetState extends State<MainSkillsAnalyticsWidget> {
  bool isToggled = true;

  @override
  Widget build(BuildContext context) {
    return BaseToggleSwitchWidget(
      isToggled: isToggled,
      widget1: widget.chart,
      widget2: widget.table,
      onChanged: (value) {
        setState(() {
          isToggled = value;
        });
      },
    );
  }
}
