import 'package:exam_analyzer/ui/core/themes/dimes.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:flutter/material.dart';

class BaseDataTileWidget extends StatelessWidget {
  const BaseDataTileWidget({
    super.key,
    this.name,
    this.value,
    this.onPressed,
    this.onLongPress,
    this.icon,
  });

  final String? name;
  final String? value;
  final Function()? onPressed;
  final Function()? onLongPress;
  final Icon? icon;

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
              name != null
                  ? Text(name!, style: Theme.of(context).textTheme.bodyMedium)
                  : SizedBox(),
              value != null
                  ? Text(value!, style: Theme.of(context).textTheme.titleLarge)
                  : icon ?? Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}
