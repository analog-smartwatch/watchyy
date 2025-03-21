import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watchyy/locations/locations_helpers.dart';
import 'package:watchyy/navigation/navigation.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/screens/screens.dart';

GoRouter getNotConnectedRouter(BuildContext context) {
  final theme = Theme.of(context);
  final textTheme = theme.textTheme;
  final textColor = theme.colorScheme.onSurface;

  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return AppTheme(
            data: AppThemeData(
              appTypography: AppTypography(
                bodyLarge: textTheme.bodyLarge!.copyWith(color: textColor),
                bodyMedium: textTheme.bodyMedium!.copyWith(color: textColor),
                bodySmall: textTheme.bodySmall!.copyWith(color: textColor),
                headlineLarge:
                    textTheme.headlineLarge!.copyWith(color: textColor),
                headlineMedium:
                    textTheme.headlineMedium!.copyWith(color: textColor),
                headlineSmall:
                    textTheme.headlineSmall!.copyWith(color: textColor),
                titleLarge: textTheme.titleLarge!.copyWith(color: textColor),
                titleMedium: textTheme.titleMedium!.copyWith(color: textColor),
                titleSmall: textTheme.titleSmall!.copyWith(color: textColor),
              ),
            ),
            child: const MyWatchesScreen(),
          );
        },
      ),
    ],
  );
}

StatefulShellBranch _getHomeShell(
  GlobalKey<NavigatorState>? navigatorKey,
) {
  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: homePath,
        pageBuilder: (_, state) => NoTransitionPage(
          child: HomeScreen(key: state.pageKey),
        ),
      ),
    ],
  );
}

StatefulShellBranch _getSettingsShell(
  GlobalKey<NavigatorState>? navigatorKey,
) {
  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: settingsPath,
        pageBuilder: (_, state) => NoTransitionPage(
          child: SettingsScreen(key: state.pageKey),
        ),
      ),
    ],
  );
}

GoRouter getRouter() {
  final branches = [
    _getHomeShell(shellNavigatorHomeKey),
    _getSettingsShell(shellNavigatorSettingsKey),
  ];

  /* https://github.com/bizz84/nestednavigationexamples/blob/main/examples/gorouter/lib/main.dart */
  return GoRouter(
    initialLocation: homePath,
    debugLogDiagnostics: kDebugMode,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) {
          return ScaffoldWithNestedNavigation(
            navigationShell: navigationShell,
          );
        },
        branches: branches,
      ),
    ],
  );
}
