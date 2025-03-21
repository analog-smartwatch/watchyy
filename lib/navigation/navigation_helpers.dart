import 'package:flutter/material.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/locations/locations.dart';
import 'package:watchyy/widgets/widgets.dart';

Icon _homeTabIcon(Color? color) => Icon(WAIcons.home, color: color);
Icon _settingsTabIcon(Color? color) => Icon(WAIcons.settings, color: color);

List<BottomNavigationBarItem> getTabBarItems(Translations translations) {
  return [
    BottomNavigationBarItem(
      icon: _homeTabIcon(null),
      label: PrimaryTabScreen.homeScreen.title(translations),
    ),
    BottomNavigationBarItem(
      icon: _settingsTabIcon(null),
      label: PrimaryTabScreen.settingsScreen.title(translations),
    ),
  ];
}

List<NavigationDestination> getDestinations({
  required int selectedIndex,
  required BuildContext context,
}) {
  final iconColorSelected = Theme.of(context).colorScheme.primary;
  final iconColorUnselected = Theme.of(context).colorScheme.onInverseSurface;

  return [
    NavigationDestination(
      label: 'Scan',
      icon: _homeTabIcon(
        selectedIndex == 0 ? iconColorSelected : iconColorUnselected,
      ),
    ),
    NavigationDestination(
      label: 'Settings',
      icon: _settingsTabIcon(
        selectedIndex == 2 ? iconColorSelected : iconColorUnselected,
      ),
    ),
  ];
}
