import 'package:exam_analyzer/ui/attempts/viewmodels/attempt_detail_viewmodel.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/skill_breakdown_widget.dart';
import 'package:exam_analyzer/ui/core/ui/sub_skill_break_down_widget.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttemptDetailScreen extends StatelessWidget {
  const AttemptDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AttemptDetailViewmodel>(
      builder: (context, viewmodel, child) {
        if (viewmodel.attempt != null) {
          return ListView(
            children: [
              const SizedBox(height: 12),
              SkillsBreakdownWidget(
                report: viewmodel.attempt!,
                maxScore: ChartUtils.maxScore,
              ),
              SizedBox(height: 16),
              SubSkillBreakDownWidget(
                title: AppLocalization.of(context).subSkillBreakDown,
                subskills: viewmodel.attempt!.subskills,
              ),
            ],
          );
        } else {
          if (viewmodel.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text(
                viewmodel.error ??
                    AppLocalization.of(context).somethingWentWrong,
              ),
            );
          }
        }
      },
    );
  }
}
