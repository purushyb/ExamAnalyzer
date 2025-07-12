import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:flutter/material.dart';

class SkillWithProgressbarWidget extends StatelessWidget {
  const SkillWithProgressbarWidget({
    super.key,
    required this.skillName,
    required this.skillValue,
    required this.maxScore,
  });
  final String skillName;
  final int skillValue;
  final int maxScore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(skillName, style: TextTheme.of(context).bodyMedium),
          ),
          Text(skillValue.toString(), style: TextTheme.of(context).bodyMedium),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: skillValue / maxScore,
              minHeight: 12,
              color: ChartUtils.getColorWithName(skillName),
            ),
          ),
        ],
      ),
    );
  }
}
