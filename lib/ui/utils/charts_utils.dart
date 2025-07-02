import 'package:exam_analyzer/data/utils/array_utils.dart';
import 'package:flutter/material.dart';

class ChartUtils {
  static Color getColorForChart(int index) {
    final colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
    return colors[ArrayUtils.circularArrayIndex(colors.length, index)];
  }
}
