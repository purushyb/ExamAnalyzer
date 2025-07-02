import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttemptListTile extends StatelessWidget {
  final ScoreReport report;
  final int attemptNumber;

  const AttemptListTile({
    super.key,
    required this.report,
    required this.attemptNumber,
  });

  Widget _buildScoreCircle(String label, int value, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 36,
              width: 36,
              child: CircularProgressIndicator(
                value: value / 100,
                strokeWidth: 6,
                backgroundColor: Colors.grey.shade200,
                color: color,
              ),
            ),
            Text('$value'),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: ListTile(
          leading: CircleAvatar(child: Text('$attemptNumber')),
          title: Text(DateFormat.yMMMMd().format(report.date)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildScoreCircle(
                  'Speaking',
                  report.speaking,
                  ChartUtils.getColorForChart(0),
                ),
                _buildScoreCircle(
                  'Reading',
                  report.reading,
                  ChartUtils.getColorForChart(1),
                ),
                _buildScoreCircle(
                  'Writing',
                  report.writing,
                  ChartUtils.getColorForChart(2),
                ),
                _buildScoreCircle(
                  'Listening',
                  report.listening,
                  ChartUtils.getColorForChart(3),
                ),
              ],
            ),
          ),
          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
