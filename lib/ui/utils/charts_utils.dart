import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/utils/array_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartUtils {
  static final int maxScore = 90;
  static final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  static Color getColorForChart(int index) {
    return colors[ArrayUtils.circularArrayIndex(colors.length, index)];
  }

  static Color getColorWithName(String name) {
    switch (name.toLowerCase()) {
      case 'speaking':
        return colors[0];
      case 'reading':
        return colors[1];
      case 'writing':
        return colors[2];
      case 'listening':
        return colors[3];
      default:
        return colors[2];
    }
  }

  static List<List<FlSpot>> convertToFlSpotSeries(List<ScoreReport> reports) {
    final List<FlSpot> listeningPoints = [];
    final List<FlSpot> speakingPoints = [];
    final List<FlSpot> readingPoints = [];
    final List<FlSpot> writingPoints = [];
    final List<FlSpot> gsePoints = [];

    // Currently has only capability to show 10 data points
    for (int i = 0; i < 10; i++) {
      final report = reports[i];
      listeningPoints.add(FlSpot(i.toDouble(), report.listening.toDouble()));
      speakingPoints.add(FlSpot(i.toDouble(), report.speaking.toDouble()));
      readingPoints.add(FlSpot(i.toDouble(), report.reading.toDouble()));
      writingPoints.add(FlSpot(i.toDouble(), report.writing.toDouble()));
      gsePoints.add(FlSpot(i.toDouble(), report.gseScore.toDouble()));
    }

    return [
      listeningPoints,
      speakingPoints,
      readingPoints,
      writingPoints,
      gsePoints,
    ];
  }
}
