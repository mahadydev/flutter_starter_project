import 'package:flutter_starter_project/core/shared/widgets/error_screen.dart';
import 'package:flutter_starter_project/features/showcase_screen/screens/showcase_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class AppRouter {
  AppRouter._();

  // Define the root navigator key
  // This is used to navigate to the root of the app from anywhere in the app
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  // Define the shell navigator key
  // This is used to navigate to the shell of the app from anywhere in the app
  // This is useful for nested navigation
  // static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static const String demo = '/demo';

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: demo,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: AppRouter.demo,
        builder: (BuildContext context, GoRouterState state) =>
            const ShowcaseScreen(),
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        ErrorScreen(error: state.error),
  );
}
