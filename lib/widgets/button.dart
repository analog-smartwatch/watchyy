import 'package:flutter/material.dart';
import 'package:watchyy/styles/styles.dart';

final _borderRadius = BorderRadius.circular(12);

class WAButtonIcon {
  WAButtonIcon({
    this.icon,
    this.color = Colors.white,
    this.size = 20,
  });

  final IconData? icon;
  final Color? color;
  final double? size;
}

enum WAButtonType {
  primary,
  secondary,
  danger;

  ButtonStyle getStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return switch (this) {
      WAButtonType.primary => ButtonStyle(
          backgroundColor: WidgetStateProperty.all(colorScheme.primary),
          elevation: WidgetStateProperty.all<double>(0),
          splashFactory: NoSplash.splashFactory,
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: _borderRadius),
          ),
        ),
      WAButtonType.secondary => ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          elevation: WidgetStateProperty.all<double>(0),
          backgroundColor: WidgetStateProperty.all(colorScheme.secondary),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: _borderRadius),
          ),
        ),
      WAButtonType.danger => ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          elevation: WidgetStateProperty.all<double>(0),
          backgroundColor: WidgetStateProperty.all(Colors.red),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: _borderRadius),
          ),
        ),
    };
  }
}

class WAButton extends StatelessWidget {
  const WAButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.type,
    this.icon,
    this.textScaler,
    this.appTypography,
  });

  final VoidCallback onPressed;
  final String text;
  final WAButtonType type;
  final IconData? icon;
  final TextScaler? textScaler;

  /// Used for Wolt Bottom Sheet
  final AppTypography? appTypography;

  TextStyle getTextStyle(BuildContext context) {
    final appTypo = appTypography ?? AppTheme.of(context).appTypography;

    return appTypo.titleMedium.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _getText(BuildContext context) {
    final style = getTextStyle(context);

    return Padding(
      padding: WASpacings.md.vertical,
      child: Text(
        text,
        style: style,
        textScaler: textScaler,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (icon case final icon?) {
      return ElevatedButton.icon(
        icon: Icon(
          icon,
          size: WAIconSize.xs.size,
          color: Colors.white,
        ),
        onPressed: onPressed,
        style: type.getStyle(context),
        label: _getText(context),
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: type.getStyle(context),
      child: _getText(context),
    );
  }
}
