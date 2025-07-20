import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:flutter/material.dart';

class BaseListTileToggle extends StatelessWidget {
  const BaseListTileToggle({
    super.key,
    required this.title,
    required this.iconData,
    required this.isToggled,
    required this.onChanged,
  });

  final String title;
  final IconData iconData;
  final bool isToggled;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return BasePaddingWidget(
      child: ListTile(
        leading: Icon(iconData),
        trailing: Switch(value: isToggled, onChanged: onChanged),
        title: Text(title),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
