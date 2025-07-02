import 'package:exam_analyzer/data/models/score_report.dart';
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
      const DataColumn(label: Text('Test ')),
      for (int i = 0; i < maxSubskills; i++)
        DataColumn(label: Text('Subskill ${i + 1}')),
    ];

    // Rows
    final rows =
        reports.asMap().entries.map((entry) {
          final index = entry.key;
          final report = entry.value;

          final cells = <DataCell>[
            DataCell(Text('Test ${index + 1}')),
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(columnSpacing: 16, columns: columns, rows: rows),
      ),
    );
  }
}
