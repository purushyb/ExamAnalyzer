import 'package:exam_analyzer/routing/models/route_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellScaffold extends StatelessWidget {
  const ShellScaffold({super.key, required this.child, required this.state});
  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final location = state.uri.toString();
    final title = RouteItem.fromRoute(location).titleKey;
    return Scaffold(appBar: AppBar(title: Text(title)), body: child);
  }
}
