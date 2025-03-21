import 'package:flutter/material.dart';
import 'package:watchyy/i18n/i18n.dart';

const scanningPath = '/scanning';

// Tabs
const homePath = '/home';
const settingsPath = '/settings';

final GlobalKey<NavigatorState> shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final GlobalKey<NavigatorState> shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

int? getCurrentTabIndex(PrimaryTabScreen primaryTabScreen) {
  return switch (primaryTabScreen) {
    PrimaryTabScreen.homeScreen => 0,
    PrimaryTabScreen.settingsScreen => 1,
  };
}

enum PrimaryTabScreen {
  homeScreen,
  settingsScreen;

  String title(Translations t) => switch (this) {
        homeScreen => t.general.bottom_navigation.home,
        settingsScreen => t.general.bottom_navigation.settings,
      };
}
