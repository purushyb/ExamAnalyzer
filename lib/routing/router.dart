import 'dart:io';

import 'package:exam_analyzer/ui/attempts/viewmodels/add_attempt_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/viewmodels/attempt_detail_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/viewmodels/attempts_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/widgets/add_attempt_screen.dart';
import 'package:exam_analyzer/ui/attempts/widgets/attempt_detail_screen.dart';
import 'package:exam_analyzer/ui/attempts/widgets/attempts_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../ui/dashboard/viewmodels/dashboard_viewmodel.dart';
import '../ui/dashboard/widgets/dashboard_screen.dart';

import 'routes.dart';

List<RouteBase> _commonRoutes = [
  GoRoute(
    path: Routes.dashboard,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create: (context) => DashboardViewModel(),
        child: DashboardScreen(),
      );
    },
  ),
  GoRoute(
    path: Routes.attempts,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create: (context) => AttemptsViewmodel(),
        child: Attemptsscreen(),
      );
    },
  ),
  GoRoute(
    path: Routes.attemptDetails,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create: (context) => AttemptDetailViewmodel(attemptId: 0),
        child: AttemptDetailScreen(),
      );
    },
  ),
  GoRoute(
    path: Routes.addAttempt,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create: (context) => AddAttemptViewmodel(),
        child: AddAttemptScreen(),
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
  initialLocation: Routes.dashboard,
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
