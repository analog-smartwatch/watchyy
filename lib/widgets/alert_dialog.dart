import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyy/styles/styles.dart';

Future<T?> showAlertDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = false,
  bool useRootNavigator = true,
}) {
  final platform = getPlatform(context);

  return switch (platform) {
    TargetPlatform.iOS => showCupertinoDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
      ),
    TargetPlatform.macOS ||
    TargetPlatform.android ||
    TargetPlatform.fuchsia ||
    TargetPlatform.linux ||
    TargetPlatform.windows =>
      showDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
      ),
  };
}

class WAAlertDialogAction {
  const WAAlertDialogAction({
    required this.text,
    required this.onTap,
    this.defaultAction = false,
    this.destructiveAction = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool defaultAction;
  final bool destructiveAction;
}

class WAAlertDialog extends StatelessWidget {
  const WAAlertDialog({
    super.key,
    required this.title,
    required this.actions,
    required this.subtitle,
    this.icon,
  });

  final String title;
  final String subtitle;
  final List<WAAlertDialogAction> actions;

  /// Will only be displayed on Android.
  final IconData? icon;

  Widget _buildMaterialAlertDialog(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = isAppInDarkMode(context);

    final actionsWidgets = actions
        .map(
          (action) => TextButton(
            onPressed: action.onTap,
            child: Text(
              action.text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: action.destructiveAction
                        ? colorScheme.error
                        : colorScheme.primary,
                  ),
            ),
          ),
        )
        .toList();

    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor:
          isDarkMode ? colorScheme.surface : colorScheme.inverseSurface,
      title: Column(
        children: [
          if (icon case final icon?)
            Padding(
              padding: WASpacings.lg.bottom,
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          Text(title),
        ],
      ),
      content: Text(subtitle),
      actions: actionsWidgets,
    );
  }

  Widget _buildIOSAlertDialog(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final actionsWidgets = actions
        .map(
          (action) => CupertinoDialogAction(
            isDestructiveAction: action.destructiveAction,
            onPressed: action.onTap,
            child: Text(
              action.text,
              style:
                  CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
                        color: action.destructiveAction
                            ? colorScheme.error
                            : colorScheme.primary,
                        fontWeight: action.defaultAction
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
            ),
          ),
        )
        .toList();

    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: actionsWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    final platform = getPlatform(context);

    return switch (platform) {
      TargetPlatform.iOS => _buildIOSAlertDialog(context),
      _ => _buildMaterialAlertDialog(context),
    };
  }
}
