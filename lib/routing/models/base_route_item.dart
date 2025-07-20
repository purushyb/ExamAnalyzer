import 'package:exam_analyzer/routing/routes.dart';
import 'package:flutter/material.dart';

// order is important
enum BaseRouteItem {
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
  pitchDetection(
    route: Routes.pitchDetection,
    icon: Icons.graphic_eq,
    titleKey: "realTimePitchScreenTitle",
  ),
  addAttempt(
    route: Routes.addAttempt,
    icon: Icons.add,
    titleKey: "addAttemptsScreenTitle",
    isEligibleForBottomNav: false,
  ),
  attemptDetails(
    route: Routes.attemptDetails,
    icon: Icons.details,
    titleKey: "attemptDetailScreenTitle",
    isEligibleForBottomNav: false,
  ),
  nextExamDate(
    route: Routes.nextExamDate,
    icon: Icons.event,
    titleKey: "nextExamDateScreenTitle",
    isEligibleForBottomNav: false,
  ),
  linkNotes(
    route: Routes.linkNotes,
    icon: Icons.event,
    titleKey: "",
    isEligibleForBottomNav: false,
  );

  final String route;
  final IconData icon;
  final String titleKey;
  final bool isEligibleForBottomNav;

  const BaseRouteItem({
    required this.route,
    required this.icon,
    required this.titleKey,
    this.isEligibleForBottomNav = true,
  });

  static BaseRouteItem fromRoute(String route) {
    return BaseRouteItem.values.firstWhere(
      (item) => item.route == route,
      orElse: () => BaseRouteItem.dashboard,
    );
  }

  static int indexFromRoute(String route) =>
      BaseRouteItem.values.indexOf(fromRoute(route));
}
