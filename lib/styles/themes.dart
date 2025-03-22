import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watchyy/styles/fonts.dart';
import 'package:watchyy/styles/themes_mobile_utils.dart';

MaterialColor _getMaterialColor(Color color) {
  final red = color.red;
  final green = color.green;
  final blue = color.blue;

  final shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(color.value, shades);
}

const _primaryColor = Color(0xFF2F80ED); //#2F80ED
final _primary = _getMaterialColor(_primaryColor);
const _scaffoldBackgroundColorLightMode = Colors.white;
const _scaffoldBackgroundColorDarkMode = Colors.black87;

final lightThemeData = ThemeData(
  dialogBackgroundColor: _scaffoldBackgroundColorLightMode,
  splashColor: Colors.transparent,
  primaryColor: Colors.teal,
  secondaryHeaderColor: Colors.black,
  dividerColor: Colors.white54,
  scaffoldBackgroundColor: _scaffoldBackgroundColorLightMode,
  textTheme: Fonts.textLightTheme,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(
      color: _primaryColor,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: labelTextStyleLightMode(_primary),
    surfaceTintColor: _scaffoldBackgroundColorLightMode,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: _primary,
    accentColor: Colors.black,
  ).copyWith(
    surface: backgroundColor,
    onSurface: Colors.black,
    onSurfaceVariant: Colors.grey[300], // Divider
    inverseSurface: Colors.grey[100], // Accordion, TextField surface
    onInverseSurface: unselectedColorLightMode,
  ),
);

final darkThemeData = ThemeData(
  dialogBackgroundColor: _scaffoldBackgroundColorDarkMode,
  splashColor: Colors.transparent,
  primaryColor: Colors.teal,
  secondaryHeaderColor: Colors.white,
  dividerColor: Colors.black12,
  scaffoldBackgroundColor: _scaffoldBackgroundColorDarkMode,
  textTheme: Fonts.textDarkTheme,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: labelTextStyleDarkMode(_primary),
    backgroundColor: _scaffoldBackgroundColorDarkMode,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: _primary,
    accentColor: Colors.grey[900],
  ).copyWith(
    surface: Colors.black,
    onSurface: Colors.white,
    onSurfaceVariant: Colors.grey[900], // Divider
    inverseSurface: Colors.grey[900], // Accordion, TextField surface
    onInverseSurface: unselectedColorDarkMode,
  ),
);

class AppTheme extends InheritedWidget {
  const AppTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class AppTypography {
  AppTypography({
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
  });

  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
}

class AppThemeData {
  AppThemeData({
    required this.appTypography,
  });

  AppTypography appTypography;
}
