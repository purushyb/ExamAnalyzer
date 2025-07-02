import 'package:exam_analyzer/ui/attempts/viewmodels/attempts_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/widgets/attempt_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Attemptsscreen extends StatelessWidget {
  const Attemptsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AttemptsViewmodel>(
      builder: (context, viewModel, child) {
        return ListView.builder(
          itemCount: viewModel.reports.length,
          itemBuilder: (context, index) {
            return AttemptListTile(
              report: viewModel.reports[index],
              attemptNumber: index + 1,
            );
          },
        );
      },
    );
  }
}
