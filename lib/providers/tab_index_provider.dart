import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

const initialIndex = kDebugMode ? 0 : 0;

class TabIndex {
  TabIndex({required this.index});

  final int index;
}

class TabIndexNotifier extends StateNotifier<TabIndex> {
  TabIndexNotifier() : super(TabIndex(index: initialIndex));

  void updateTabIndex(int index) {
    state = TabIndex(index: index);
  }
}

final tabIndexProvider =
    StateNotifierProvider<TabIndexNotifier, TabIndex>((ref) {
  return TabIndexNotifier();
});
