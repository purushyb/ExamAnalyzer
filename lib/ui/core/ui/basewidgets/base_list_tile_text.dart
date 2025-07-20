import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:flutter/material.dart';

class BaseListTileText extends StatelessWidget {
  const BaseListTileText({
    super.key,
    required this.title,
    required this.iconData,
    required this.onPressed,
  });
  final String title;
  final IconData iconData;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BasePaddingWidget(
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        onTap: onPressed,
      ),
    );
  }
}
