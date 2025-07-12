import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/utils/ux_simplification_utils.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:flutter/material.dart';

class SubskillTableWidget extends StatelessWidget {
  final List<ScoreReport> reports;

  const SubskillTableWidget({super.key, required this.reports});

  @override
  Widget build(BuildContext context) {
    // Find maximum subskills count to define columns
    final maxSubskills = reports
        .map((r) => r.subskills.length)
        .fold<int>(0, (prev, len) => len > prev ? len : prev);

    // Header
    final columns = <DataColumn>[
      DataColumn(label: Text(AppLocalization.of(context).dateTitle)),
      for (int i = 0; i < maxSubskills; i++)
        DataColumn(
          label: Text(
            AppLocalization.of(context).subSkillTitle(value: i.toString()),
          ),
        ),
    ];

    // Rows
    final rows =
        reports.asMap().entries.map((entry) {
          final index = entry.key;
          final report = entry.value;

          final cells = <DataCell>[
            DataCell(Text(reports[index].date.readableDate())),
            ...report.subskills.map(
              (s) => DataCell(Text('${s.score} - ${s.name}')),
            ),
          ];

          // Fill remaining columns if subskills are less than max
          while (cells.length < columns.length) {
            cells.add(const DataCell(Text('')));
          }

          return DataRow(cells: cells);
        }).toList();

    return BasePaddingWidget(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(columnSpacing: 16, columns: columns, rows: rows),
        ),
      ),
    );
  }
}
