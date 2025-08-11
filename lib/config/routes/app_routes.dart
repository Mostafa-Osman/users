import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:users/features/users/presentation/screens/user_details_screen.dart';
import 'package:users/features/users/presentation/screens/users_screen.dart';

class Routes {
  static const String initial = '/';
  static const String userDetails = '/userDetails';
}

class AppRoutes {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GoRouter appRouter = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.initial,
    routes: [
      GoRoute(
        path: Routes.initial,
        builder: (BuildContext context, GoRouterState state) {
          return const UsersScreen();
        },
      ),
      GoRoute(
        path: Routes.userDetails,
        builder: (BuildContext context, GoRouterState state) {
          final user = state.extra as int;
          return UserDetailsScreen(userId: user);
        },
      ),
    ],
  );
}
