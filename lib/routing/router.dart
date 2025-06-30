import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../ui/dashboard/viewmodels/dashboard_viewmodel.dart';
import '../ui/dashboard/widgets/dashboard_screen.dart';

import 'routes.dart';

List<RouteBase> _commonRoutes = [
  GoRoute(
    path: Routes.home,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create: (context) => DashboardViewModel(),
        child: DashboardScreen(),
      );
    },
  ),
];
List<RouteBase> _desktopOnlyRoutes = [];
List<RouteBase> _mobileOnlyRoutes = [];

List<RouteBase> _getRoutes() {
  List<RouteBase> routes = [..._commonRoutes];
  if (Platform.isAndroid || Platform.isIOS) {
    routes.addAll(_mobileOnlyRoutes);
  } else {
    routes.addAll(_desktopOnlyRoutes);
  }
  return routes;
}

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Analytics")),
          body: Padding(padding: EdgeInsets.all(16), child: child),
        );
      },
      routes: _getRoutes(),
    ),
  ],
);
