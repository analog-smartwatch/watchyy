import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

const _initialIndex = kDebugMode ? 0 : 0;

class TabIndex {
  TabIndex({required this.index});

  final int index;
}

class TabIndexNotifier extends StateNotifier<TabIndex> {
  TabIndexNotifier() : super(TabIndex(index: _initialIndex));

  void updateTabIndex(int index) {
    state = TabIndex(index: index);
  }
}

final tabIndexProvider =
    StateNotifierProvider<TabIndexNotifier, TabIndex>((ref) {
  return TabIndexNotifier();
});
