import 'package:exam_analyzer/ui/audio/viewmodels/pitch_viewmodel.dart';
import 'package:exam_analyzer/ui/core/themes/dimens.dart';
import 'package:exam_analyzer/ui/core/ui/reusables/container_with_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

class PitchScreen extends StatelessWidget {
  const PitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Real-time Pitch")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: PitchGraphWidget(),
      ),
    );
  }
}

class PitchGraphWidget extends StatelessWidget {
  const PitchGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PitchViewModel>(context);

    final spots =
        viewModel.pitches
            .asMap()
            .entries
            .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
            .toList();

    return ContainerWithBorder(
      padding: EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: Dimens.of(context).aspectRatio,
        child: LineChart(
          LineChartData(
            minY: 50,
            maxY: 300,
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 45,
                  interval: 50,
                  getTitlesWidget: (value, _) {
                    if (value >= 50 && value <= 450) {
                      return Text(
                        '${value.toInt()} Hz',
                        style: const TextStyle(fontSize: 10),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(show: true),
            gridData: FlGridData(show: true),

            rangeAnnotations: RangeAnnotations(
              horizontalRangeAnnotations: [
                HorizontalRangeAnnotation(
                  y1: 85,
                  y2: 180,
                  color: Colors.blue.withValues(alpha: 0.2),
                ),
                HorizontalRangeAnnotation(
                  y1: 165,
                  y2: 255,
                  color: Colors.pink.withValues(alpha: 0.2),
                ),
              ],
            ),

            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: Colors.deepPurple,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
