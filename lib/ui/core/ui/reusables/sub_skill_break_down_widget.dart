import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_container_with_border.dart';
import 'package:exam_analyzer/ui/core/ui/reusables/skill_with_progressbar_widget.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:flutter/material.dart';

class SubSkillBreakDownWidget extends StatelessWidget {
  final List<Subskill> subskills;
  final String title;

  const SubSkillBreakDownWidget({
    super.key,
    required this.subskills,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: BaseContainerWithBorder(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child:
            subskills.isNotEmpty
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 12),
                    ...subskills.map(
                      (subskill) => SkillWithProgressbarWidget(
                        skillName: subskill.name,
                        skillValue: subskill.score,
                        maxScore: ChartUtils.maxScore,
                      ),
                    ),
                  ],
                )
                : Center(
                  child: Text(AppLocalization.of(context).noSubskillsMsg),
                ),
      ),
    );
  }
}
