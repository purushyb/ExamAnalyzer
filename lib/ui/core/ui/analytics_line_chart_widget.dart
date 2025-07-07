import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.dataPoints});

  final Color lineTouchColor = Colors.black;
  final Color xAxisBorderColor = Colors.black;
  final double startX = 0;
  final double endX = 10;
  final double startY = 60;
  final double endY = 90;
  final Color speakingSectionColor = Colors.red;
  final Color readingSectionColor = Colors.blue;
  final Color writingSectionColor = Colors.green;
  final Color listeningSectionColor = Colors.yellow;
  final double barWidth = 3.0;
  final bool showDotData = true;
  final List<List<FlSpot>> dataPoints;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      lineChartData,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get lineChartData => LineChartData(
    lineTouchData: lineTouchData,
    gridData: gridData,
    titlesData: titlesData,
    borderData: borderData,
    lineBarsData: lineBarsData(),
    minX: startX,
    maxX: endX,
    minY: startY,
    maxY: endY,
  );

  LineTouchData get lineTouchData => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => lineTouchColor,
    ),
  );

  FlTitlesData get titlesData => FlTitlesData(
    bottomTitles: AxisTitles(sideTitles: bottomTitles),
    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    leftTitles: AxisTitles(sideTitles: leftTitles),
  );

  List<LineChartBarData> lineBarsData() {
    List<LineChartBarData> result = [];
    for (final (index, item) in dataPoints.indexed) {
      result.add(
        LineChartBarData(
          isCurved: true,
          color: ChartUtils.getColorForChart(index),
          barWidth: barWidth,
          isStrokeCapRound: true,
          dotData: FlDotData(show: showDotData),
          belowBarData: BarAreaData(show: false),
          spots: item,
        ),
      );
    }
    return result;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text = value.toInt().toString();
    return SideTitleWidget(
      meta: meta,
      child: Text(text, textAlign: TextAlign.center),
    );
  }

  SideTitles get leftTitles => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 5,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text = Text((value.toInt() + 1).toString());

    return SideTitleWidget(meta: meta, space: 10, child: text);
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 40,
    minIncluded: true,
    maxIncluded: false,
    interval: 2,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: Border(
      bottom: BorderSide(),
      left: const BorderSide(color: Colors.transparent),
      right: const BorderSide(color: Colors.transparent),
      top: const BorderSide(color: Colors.transparent),
    ),
  );
}

class AnalyticsLineChart extends StatefulWidget {
  const AnalyticsLineChart({
    super.key,
    required this.lineChartData,
    this.child,
  });

  final List<List<FlSpot>> lineChartData;
  final Switch? child;

  @override
  State<StatefulWidget> createState() => AnalyticsLineChartState();
}

class AnalyticsLineChartState extends State<AnalyticsLineChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: AspectRatio(
        aspectRatio: 1.23,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(children: [widget.child ?? SizedBox()]),
                const SizedBox(height: 37),
                Text(
                  AppLocalization.of(context).scoreTrend,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 37),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, left: 6),
                    child: _LineChart(dataPoints: widget.lineChartData),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
