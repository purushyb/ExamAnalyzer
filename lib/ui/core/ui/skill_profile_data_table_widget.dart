import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:flutter/material.dart';

class SkillProfileDataTableWidget extends StatelessWidget {
  final List<ScoreReport> reports;

  const SkillProfileDataTableWidget({super.key, required this.reports});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // allow horizontal scroll
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('GSE Score')),
            DataColumn(label: Text('Speaking')),
            DataColumn(label: Text('Reading')),
            DataColumn(label: Text('Writing')),
            DataColumn(label: Text('Listening')),
          ],
          rows: List<DataRow>.generate(reports.length, (index) {
            final report = reports[index];
            return DataRow(
              cells: [
                DataCell(Text('Test ${index + 1}')),
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
    );
  }
}
