import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/screens/screens.dart';

GoRouter getRouter(BuildContext context) {
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
            child: const MyWatches(),
          );
        },
      ),
    ],
  );
}
