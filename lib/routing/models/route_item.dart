import 'package:exam_analyzer/routing/routes.dart';
import 'package:flutter/material.dart';

enum RouteItem {
  dashboard(
    route: Routes.dashboard,
    icon: Icons.dashboard,
    titleKey: "dashboardScreenTitle",
  ),
  attempts(
    route: Routes.attempts,
    icon: Icons.list_alt,
    titleKey: "attemptsListScreenTitle",
  ),
  addAttempt(
    route: Routes.addAttempt,
    icon: Icons.event,
    titleKey: "addAttemptsScreenTitle",
  ),
  attemptDetails(
    route: Routes.attemptDetails,
    icon: Icons.event,
    titleKey: "attemptDetailScreenTitle",
  ),
  nextExamDate(
    route: Routes.nextExamDate,
    icon: Icons.event,
    titleKey: "nextExamDateScreenTitle",
  ),
  linkNotes(route: Routes.linkNotes, icon: Icons.event, titleKey: ""),
  pitchDetection(
    route: Routes.pitchDetection,
    icon: Icons.graphic_eq,
    titleKey: "realTimePitchTitle",
  );

  final String route;
  final IconData icon;
  final String titleKey;

  const RouteItem({
    required this.route,
    required this.icon,
    required this.titleKey,
  });

  static RouteItem fromRoute(String route) {
    return RouteItem.values.firstWhere(
      (item) => item.route == route,
      orElse: () => RouteItem.dashboard,
    );
  }

  static int indexFromRoute(String route) =>
      RouteItem.values.indexOf(fromRoute(route));
}
