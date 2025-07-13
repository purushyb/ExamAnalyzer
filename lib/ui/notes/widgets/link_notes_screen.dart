import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_big_button_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_input_text_field.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:exam_analyzer/ui/notes/viewmodels/link_notes_viewmodel.dart';
import 'package:flutter/material.dart';

class LinkNotesScreen extends StatelessWidget {
  const LinkNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LinkNotesViewmodel>(
      appBarBuilder:
          (viewModel) =>
              AppBar(title: Text(AppLocalization.of(context).addNotesTitle)),
      childBuilder: (viewModel) {
        return Center(
          child: Column(
            children: [
              BaseInputTextField(
                onChanged: viewModel.updateCurrentLink,
                initialValue: viewModel.currentLink,
                label: AppLocalization.of(context).addALinkTitle,
              ),
              BaseBigButtonWidget(
                onPressed: viewModel.submitLink,
                label: AppLocalization.of(context).submitLinkTitle,
              ),
            ],
          ),
        );
      },
    );
  }
}
