import 'package:exam_analyzer/ui/audio/viewmodels/pitch_screen_viewmodel.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/themes/dimens.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PitchScreen extends StatelessWidget {
  const PitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PitchScreenViewModel>(
      appBarBuilder:
          (viewModel) => AppBar(
            title: Text(AppLocalization.of(context).realTimePitchTitle),
          ),
      childBuilder:
          (viewModel) => BasePaddingWidget(
            child: PitchGraphWidget(dataPoints: viewModel.pitchSpots),
          ),
    );
  }
}

class PitchGraphWidget extends StatelessWidget {
  const PitchGraphWidget({super.key, required this.dataPoints});
  final List<FlSpot> dataPoints;
  final double minY = 50.0;
  final double maxY = 300.0;
  final Color maleColor = Colors.blue;
  final Color femaleColor = Colors.pink;
  final Color lineColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Dimens.of(context).aspectRatio,
      child: LineChart(
        LineChartData(
          minY: minY,
          maxY: maxY,
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
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: true),
          gridData: FlGridData(show: true),

          rangeAnnotations: RangeAnnotations(
            horizontalRangeAnnotations: [
              HorizontalRangeAnnotation(
                y1: 85,
                y2: 180,
                color: maleColor.withValues(alpha: 0.2),
              ),
              HorizontalRangeAnnotation(
                y1: 165,
                y2: 255,
                color: femaleColor.withValues(alpha: 0.2),
              ),
            ],
          ),

          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: lineColor,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
