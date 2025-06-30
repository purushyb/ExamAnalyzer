import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;
  final Color lineTouchColor = Colors.black;
  final Color xAxisBorderColor = Colors.black;
  final double startX = 1;
  final double endX = 12;
  final double startY = 65;
  final double endY = 90;
  final Color speakingSectionColor = Colors.red;
  final Color readingSectionColor = Colors.blue;
  final Color writingSectionColor = Colors.green;
  final Color listeningSectionColor = Colors.yellow;
  final double barWidth = 3.0;
  final bool showDotData = true;

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
    lineBarsData: lineBarsData,
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

  List<LineChartBarData> get lineBarsData => [
    speakingBarChartData,
    readingBarChartDate,
    writingBarChartData,
    listeningBarChartData,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
    String text = value.toInt().toString();
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  SideTitles get leftTitles => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 5,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text = Text(DateFormat('MMM').format(DateTime(0, value.toInt())));

    return SideTitleWidget(meta: meta, space: 10, child: text);
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 40,
    minIncluded: false,
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

  LineChartBarData get speakingBarChartData => LineChartBarData(
    isCurved: true,
    color: speakingSectionColor,
    barWidth: barWidth,
    isStrokeCapRound: true,
    dotData: FlDotData(show: showDotData),
    belowBarData: BarAreaData(show: false),
    spots: const [FlSpot(1, 70), FlSpot(3, 72), FlSpot(5, 74), FlSpot(10, 75)],
  );

  LineChartBarData get readingBarChartDate => LineChartBarData(
    isCurved: true,
    color: readingSectionColor,
    barWidth: barWidth,
    isStrokeCapRound: true,
    dotData: FlDotData(show: showDotData),
    belowBarData: BarAreaData(show: false),
    spots: const [FlSpot(1, 69), FlSpot(3, 71), FlSpot(5, 71), FlSpot(10, 71)],
  );
  LineChartBarData get writingBarChartData => LineChartBarData(
    isCurved: true,
    color: writingSectionColor,
    barWidth: barWidth,
    isStrokeCapRound: true,
    dotData: FlDotData(show: showDotData),
    belowBarData: BarAreaData(show: false),
    spots: const [FlSpot(1, 65), FlSpot(3, 69), FlSpot(5, 72), FlSpot(10, 80)],
  );
  LineChartBarData get listeningBarChartData => LineChartBarData(
    isCurved: true,
    color: listeningSectionColor,
    barWidth: barWidth,
    isStrokeCapRound: true,
    dotData: FlDotData(show: showDotData),
    belowBarData: BarAreaData(show: false),
    spots: const [FlSpot(1, 79), FlSpot(3, 79), FlSpot(5, 79), FlSpot(10, 79)],
  );
}

class AnalyticsLineChart extends StatefulWidget {
  const AnalyticsLineChart({super.key});

  @override
  State<StatefulWidget> createState() => AnalyticsLineChartState();
}

class AnalyticsLineChartState extends State<AnalyticsLineChart> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
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
                    child: _LineChart(isShowingMainData: isShowingMainData),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white.withValues(
                  alpha: isShowingMainData ? 1.0 : 0.5,
                ),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
