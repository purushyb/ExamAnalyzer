import 'package:exam_analyzer/ui/attempts/viewmodels/attempt_detail_viewmodel.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/reusables/base_data_tile_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:exam_analyzer/ui/core/ui/reusables/sub_skill_break_down_widget.dart';
import 'package:flutter/material.dart';

class AttemptDetailScreen extends StatelessWidget {
  const AttemptDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AttemptDetailViewmodel>(
      appBarBuilder:
          (viewModel) => AppBar(
            title: Text(AppLocalization.of(context).attemptDetailScreenTitle),
            actions: [
              IconButton(
                onPressed: () => viewModel.deleteAttempt(),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
      childBuilder: (viewModel) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseDataTileWidget(
                  name: AppLocalization.of(context).overall(),
                  value: viewModel.overallScore,
                ),
                BaseDataTileWidget(
                  name: AppLocalization.of(context).examDateTitle,
                  value: viewModel.readbleDateFormat,
                ),
              ],
            ),
            SubSkillBreakDownWidget(
              title: AppLocalization.of(context).mainSkillBreakdownTitle,
              subskills: viewModel.mainSkills,
            ),
            SubSkillBreakDownWidget(
              title: AppLocalization.of(context).subSkillBreakDown,
              subskills: viewModel.subSkills,
            ),
          ],
        );
      },
    );
  }
}
