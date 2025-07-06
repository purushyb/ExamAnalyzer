import 'package:exam_analyzer/data/utils/array_utils.dart';
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
}
