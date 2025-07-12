import 'package:exam_analyzer/ui/core/themes/dimes.dart';
import 'package:flutter/material.dart';

class BaseDataTileWidget extends StatelessWidget {
  const BaseDataTileWidget({
    super.key,
    required this.name,
    this.value,
    this.onPressed,
  });

  final String name;
  final String? value;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.of(context);
    return Padding(
      padding: dimens.edgeInsetsScreenSymmetric,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: dimens.elementPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: Theme.of(context).textTheme.bodyMedium),
              value != null
                  ? Text(value!, style: Theme.of(context).textTheme.titleLarge)
                  : Icon(Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}
