import 'dart:io';

import 'package:exam_analyzer/ui/attempts/viewmodels/add_attempt_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/viewmodels/attempt_detail_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/viewmodels/attempts_list_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/widgets/add_attempt_screen.dart';
import 'package:exam_analyzer/ui/attempts/widgets/attempt_detail_screen.dart';
import 'package:exam_analyzer/ui/attempts/widgets/attempts_list_screen.dart';
import 'package:exam_analyzer/ui/dashboard/widgets/dashboard_screen.dart';
import 'package:exam_analyzer/ui/nextexamdate/viewmodels/next_exam_date_viewmodel.dart';
import 'package:exam_analyzer/ui/nextexamdate/widgets/next_exam_date_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../ui/dashboard/viewmodels/dashboard_viewmodel.dart';

import 'routes.dart';

List<RouteBase> _commonRoutes = [
  GoRoute(
    path: Routes.dashboard,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create: (context) => DashboardViewModel(context.read(), context.read()),
        child: DashboardScreen(),
      );
    },
  ),
  GoRoute(
    path: Routes.attempts,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create:
            (context) => AttemptsListViewmodel(context.read(), context.read()),
        child: AttemptsListScreen(),
      );
    },
  ),
  GoRoute(
    path: Routes.attemptDetails,
    builder: (context, state) {
      final id = state.extra as int;
      return ChangeNotifierProvider(
        create:
            (context) => AttemptDetailViewmodel(
              id,
              context.read(),
              context.read(),
              context.read(),
            ),
        child: AttemptDetailScreen(),
      );
    },
  ),
  GoRoute(
    path: Routes.addAttempt,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create:
            (context) => AddAttemptViewmodel(
              context.read(),
              context.read(),
              context.read(),
            ),
        child: AddAttemptScreen(),
      );
    },
  ),
  GoRoute(
    path: Routes.nextExamDate,
    builder: (context, state) {
      return ChangeNotifierProvider(
        create:
            (context) => NextExamDateViewmodel(
              context.read(),
              context.read(),
              context.read(),
            ),
        child: NextExamDateScreen(),
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
  routes: _getRoutes(),
);
