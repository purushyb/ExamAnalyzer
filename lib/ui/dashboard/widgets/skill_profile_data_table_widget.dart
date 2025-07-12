import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/utils/ux_simplification_utils.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:flutter/material.dart';

class SkillProfileDataTableWidget extends StatelessWidget {
  final List<ScoreReport> reports;

  const SkillProfileDataTableWidget({super.key, required this.reports});

  @override
  Widget build(BuildContext context) {
    return BasePaddingWidget(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // allow horizontal scroll
          child: DataTable(
            columns: [
              DataColumn(label: Text(AppLocalization.of(context).dateTitle)),
              DataColumn(
                label: Text(AppLocalization.of(context).gseScoreTitle),
              ),
              DataColumn(
                label: Text(AppLocalization.of(context).speakingTitle),
              ),
              DataColumn(label: Text(AppLocalization.of(context).readingTitle)),
              DataColumn(label: Text(AppLocalization.of(context).writingTitle)),
              DataColumn(
                label: Text(AppLocalization.of(context).listeningTitle),
              ),
            ],
            rows: List<DataRow>.generate(reports.length, (index) {
              final report = reports[index];
              return DataRow(
                cells: [
                  DataCell(Text(report.date.readableDate())),
                  DataCell(Text(report.gseScore.toString())),
                  DataCell(Text(report.speaking.toString())),
                  DataCell(Text(report.reading.toString())),
                  DataCell(Text(report.writing.toString())),
                  DataCell(Text(report.listening.toString())),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
