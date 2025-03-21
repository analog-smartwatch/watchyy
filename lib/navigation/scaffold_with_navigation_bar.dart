// ignore_for_file: use_design_system_item_OAScaffold
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/navigation/navigation_helpers.dart';
import 'package:watchyy/styles/styles.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final isIos = isIOS();
    final isDarkMode = isAppInDarkMode(context);
    final border = Border(
      top: BorderSide(
        color: isDarkMode ? Colors.white : Colors.grey,
        width: 0,
      ),
    );
    const grey = Colors.grey;
    var backgroundColor =
        isAppInDarkMode(context) ? grey.shade900 : grey.shade100;
    if (isIos) {
      backgroundColor = isAppInDarkMode(context)
          ? grey.shade900.withOpacity(0.7)
          : grey.shade100.withOpacity(0.8);
    }

    if (isIos) {
      return Scaffold(
        body: CupertinoTabScaffold(
          key: UniqueKey(),
          tabBar: CupertinoTabBar(
            key: UniqueKey(),
            border: border,
            currentIndex: selectedIndex,
            backgroundColor: backgroundColor,
            onTap: onDestinationSelected,
            items: getTabBarItems(context.t),
          ),
          tabBuilder: (context, index) => body,
        ),
      );
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        backgroundColor: backgroundColor,
        indicatorColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        selectedIndex: selectedIndex,
        destinations: getDestinations(
          context: context,
          selectedIndex: selectedIndex,
        ),
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
