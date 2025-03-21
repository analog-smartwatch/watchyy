import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:watchyy/navigation/scaffold_with_navigation_bar.dart';
import 'package:watchyy/providers/providers.dart';
import 'package:watchyy/styles/styles.dart';

// Stateful navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class ScaffoldWithNestedNavigation extends ConsumerWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
          key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'),
        );
  final StatefulNavigationShell navigationShell;

  void _goBranch({
    required int index,
    required WidgetRef ref,
  }) {
    ref.read(tabIndexProvider.notifier).updateTabIndex(index);

    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final textColor = Theme.of(context).colorScheme.onSurface;

    return AppTheme(
      data: AppThemeData(
        appTypography: AppTypography(
          bodyLarge: textTheme.bodyLarge!.copyWith(color: textColor),
          bodyMedium: textTheme.bodyMedium!.copyWith(color: textColor),
          bodySmall: textTheme.bodySmall!.copyWith(color: textColor),
          headlineLarge: textTheme.headlineLarge!.copyWith(color: textColor),
          headlineMedium: textTheme.headlineMedium!.copyWith(color: textColor),
          headlineSmall: textTheme.headlineSmall!.copyWith(color: textColor),
          titleLarge: textTheme.titleLarge!.copyWith(color: textColor),
          titleMedium: textTheme.titleMedium!.copyWith(color: textColor),
          titleSmall: textTheme.titleSmall!.copyWith(color: textColor),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ScaffoldWithNavigationBar(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) => _goBranch(index: index, ref: ref),
          );
        },
      ),
    );
  }
}
