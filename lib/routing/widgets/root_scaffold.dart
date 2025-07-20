import 'package:exam_analyzer/routing/models/base_route_item.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootScaffold extends StatelessWidget {
  const RootScaffold({super.key, required this.child, required this.state});
  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final location = state.uri.toString();
    final routeItem = BaseRouteItem.fromRoute(location);
    return Scaffold(
      body: child,
      bottomNavigationBar:
          routeItem.isEligibleForBottomNav
              ? RootBottomNavBar(currentRoute: location)
              : null,
    );
  }
}

class RootBottomNavBar extends StatelessWidget {
  final String currentRoute;

  const RootBottomNavBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: BaseRouteItem.indexFromRoute(currentRoute),
      onTap: (index) {
        final selectedItem = BaseRouteItem.values[index];
        if (ModalRoute.of(context)?.settings.name != selectedItem.route) {
          context.go(selectedItem.route);
        }
      },
      items:
          BaseRouteItem.values
              .where((element) => element.isEligibleForBottomNav)
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: AppLocalization.get(item.titleKey),
                ),
              )
              .toList(),
    );
  }
}
