import 'package:exam_analyzer/routing/models/full_screen_page_data.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/themes/dimens.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_modle_view.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_container_with_border.dart';
import 'package:exam_analyzer/ui/core/ui/feature_modules/module_main_skills_line_chart/module_main_skills_line_chart_viewmodel.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    maxIncluded: true,
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

class ModuleMainSkillsLineChartWidget extends StatefulWidget {
  const ModuleMainSkillsLineChartWidget({
    super.key,
    this.aspectRatio,
    this.hideLegend,
    this.hidefullScreenToggle,
  });
  final double? aspectRatio;
  final bool? hideLegend;
  final bool? hidefullScreenToggle;

  @override
  State<StatefulWidget> createState() => ModuleMainSkillsLineChartWidgetState();
}

class ModuleMainSkillsLineChartWidgetState
    extends State<ModuleMainSkillsLineChartWidget> {
  Widget _buildLegendItem({required Color color, required String text}) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 4),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModuleMainSkillsLineChartViewmodel>(
      create:
          (context) => ModuleMainSkillsLineChartViewmodel(
            context.read(),
            context.read(),
          ),
      child: BaseModleView<ModuleMainSkillsLineChartViewmodel>(
        childBuilder:
            (viewModel) => BasePaddingWidget(
              child: BaseContainerWithBorder(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalization.of(context).scoreTrendTitle,
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          widget.hidefullScreenToggle == true
                              ? SizedBox()
                              : IconButton(
                                onPressed:
                                    () => viewModel.showInFullScreen(
                                      FullScreenPageData(
                                        child: ModuleMainSkillsLineChartWidget(
                                          aspectRatio:
                                              Dimens.mobileLandscape()
                                                  .aspectRatio,
                                          hideLegend: true,
                                          hidefullScreenToggle: true,
                                        ),
                                      ),
                                    ),
                                icon: Icon(Icons.fullscreen),
                              ),
                        ],
                      ),
                    ),
                    AspectRatio(
                      aspectRatio:
                          widget.aspectRatio ??
                          Dimens.of(context).smallWidgetAspectRatio,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: _LineChart(
                          dataPoints: viewModel.mainSkillsLineChartData,
                        ),
                      ),
                    ),
                    widget.hideLegend == true
                        ? SizedBox()
                        : Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceEvenly,
                          children: [
                            _buildLegendItem(
                              color: ChartUtils.getColorWithName(
                                AppLocalization.of(context).speakingTitle,
                              ),
                              text: AppLocalization.of(context).speakingTitle,
                            ),
                            _buildLegendItem(
                              color: ChartUtils.getColorWithName(
                                AppLocalization.of(context).readingTitle,
                              ),
                              text: AppLocalization.of(context).readingTitle,
                            ),
                            _buildLegendItem(
                              color: ChartUtils.getColorWithName(
                                AppLocalization.of(context).writingTitle,
                              ),
                              text: AppLocalization.of(context).writingTitle,
                            ),
                            _buildLegendItem(
                              color: ChartUtils.getColorWithName(
                                AppLocalization.of(context).listeningTitle,
                              ),
                              text: AppLocalization.of(context).listeningTitle,
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
