import 'package:exam_analyzer/ui/attempts/viewmodels/attempt_detail_viewmodel.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_data_tile_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:exam_analyzer/ui/core/ui/reusables/sub_skill_break_down_widget.dart';
import 'package:flutter/material.dart';

class AttemptDetailScreen extends StatelessWidget {
  const AttemptDetailScreen({super.key});

  void showDeleteConfirmation(
    BuildContext context, {
    required Function() onDeletePressed,
    required Function() onCancelPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text(AppLocalization.of(context).deleteAttemptTitle),
            content: Text(AppLocalization.of(context).deleteAttemptMsg),
            actions: [
              TextButton(
                onPressed: onDeletePressed,
                child: Text(AppLocalization.of(context).okTitle),
              ),
              TextButton(
                onPressed: onCancelPressed,
                child: Text(AppLocalization.of(context).cancelTitle),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AttemptDetailViewmodel>(
      appBarBuilder:
          (viewModel) => AppBar(
            title: Text(AppLocalization.of(context).attemptDetailScreenTitle),
            actions: [
              IconButton(
                onPressed:
                    () => showDeleteConfirmation(
                      context,
                      onDeletePressed: () {
                        Navigator.of(context).pop();
                        viewModel.deleteAttempt();
                      },
                      onCancelPressed: () => Navigator.of(context).pop(),
                    ),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
      childBuilder: (viewModel) {
        return SingleChildScrollView(
          child: Column(
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
          ),
        );
      },
    );
  }
}
