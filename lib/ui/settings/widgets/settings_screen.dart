import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_list_tile_text.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_list_tile_toggle.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:exam_analyzer/ui/settings/viewmodels/settings_viewmodel.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewmodel>(
      appBarBuilder:
          (viewModel) => AppBar(
            title: Text(AppLocalization.of(context).settingsScreenTitle),
          ),
      childBuilder:
          (viewModel) => Column(
            children: [
              BaseListTileText(
                iconData: Icons.link,
                title: AppLocalization.of(context).addNotesTitle,
                onPressed: viewModel.goToAddNotes,
              ),
              BaseListTileToggle(
                title: AppLocalization.of(context).themeTitle,
                iconData: Icons.light_mode,
                isToggled: viewModel.isDarkTheme,
                onChanged: (value) => viewModel.toggleTheme(value),
              ),
            ],
          ),
    );
  }
}
