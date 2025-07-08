import 'package:flutter/material.dart';

class PaddedScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? fab;
  final EdgeInsetsGeometry padding;

  const PaddedScaffold({
    super.key,
    required this.title,
    required this.body,
    this.fab,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(padding: padding, child: body),
      floatingActionButton: fab,
    );
  }
}
