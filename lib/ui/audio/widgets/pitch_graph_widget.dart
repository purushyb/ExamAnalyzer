import 'package:exam_analyzer/ui/audio/viewmodels/pitch_viewmodel.dart';
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

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: Colors.blue,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
