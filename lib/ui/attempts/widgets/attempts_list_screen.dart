import 'package:exam_analyzer/ui/attempts/viewmodels/attempts_list_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/widgets/attempt_list_tile.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttemptsListScreen extends StatelessWidget {
  const AttemptsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AttemptsListViewmodel>(
      appBarBuilder:
          (viewModel) => AppBar(
            title: Text(AppLocalization.of(context).attemptsListScreenTitle),
          ),
      childBuilder: (viewModel) {
        return ListView.builder(
          itemCount: viewModel.attempts.length,
          itemBuilder: (context, index) {
            return AttemptListTile(
              report: viewModel.attempts[index],
              attemptNumber: index + 1,
              onPressed: () {
                viewModel.goToAttemptDetailsScreen(
                  attemptId: viewModel.attempts[index].id,
                );
              },
            );
          },
        );
      },
      fabBuilder:
          (viewModel) => FloatingActionButton(
            onPressed: () {
              context.read<AttemptsListViewmodel>().goToAddAttemptScreen();
            },
            child: Icon(Icons.add),
          ),
    );
  }
}
