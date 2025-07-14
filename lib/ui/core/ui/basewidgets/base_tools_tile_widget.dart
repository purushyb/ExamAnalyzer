import 'package:exam_analyzer/ui/core/themes/dimens.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:flutter/material.dart';

class BaseToolsTileWidget extends StatelessWidget {
  const BaseToolsTileWidget({
    super.key,
    this.name,
    this.onPressed,
    this.onLongPress,
    required this.iconData,
  });

  final String? name;
  final Function()? onPressed;
  final Function()? onLongPress;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return BasePaddingWidget(
      child: GestureDetector(
        onTap: onPressed,
        onLongPress: onLongPress,
        child: Container(
          padding: Dimens.of(context).elementPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 32),
              name != null
                  ? Text(name!, style: Theme.of(context).textTheme.bodyMedium)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
