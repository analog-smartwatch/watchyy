import 'dart:io' show Platform;
import 'package:flutter/material.dart';

bool isAppInDarkMode(BuildContext context) {
  final brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  return brightness == Brightness.dark;
}

bool isMobilePlatform() {
  return Platform.isAndroid || Platform.isIOS;
}

bool isIOS() {
  return Platform.isIOS;
}

bool isAndroid() {
  return Platform.isAndroid;
}

bool isCupertino() {
  return Platform.isMacOS || Platform.isIOS;
}

TargetPlatform getPlatform(BuildContext context) {
  return Theme.of(context).platform;
}
