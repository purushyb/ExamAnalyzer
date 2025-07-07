import 'package:flutter/material.dart';

class AnalyticsTileWidget extends StatelessWidget {
  const AnalyticsTileWidget({
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
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
    );
  }
}
