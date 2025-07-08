import 'package:exam_analyzer/ui/attempts/viewmodels/attempts_list_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/widgets/attempt_list_tile.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/padded_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttemptsListScreen extends StatelessWidget {
  const AttemptsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScaffold(
      title: AppLocalization.of(context).attemptsListScreenTitle,
      body: Consumer<AttemptsListViewmodel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.reports.length,
            itemBuilder: (context, index) {
              return AttemptListTile(
                report: viewModel.reports[index],
                attemptNumber: index + 1,
                onPressed: () {
                  viewModel.goToAttemptDetailsScreen(
                    attemptId: viewModel.reports[index].id,
                  );
                },
              );
            },
          );
        },
      ),
      fab: FloatingActionButton(
        onPressed: () {
          context.read<AttemptsListViewmodel>().goToAddAttemptScreen();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
