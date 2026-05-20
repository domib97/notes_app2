import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier to manage the active bottom navigation tab.
class NavigationNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setTab(int index) {
    state = index;
  }
}

/// Provider to track the active bottom navigation tab.
final navigationProvider = NotifierProvider<NavigationNotifier, int>(NavigationNotifier.new);

/// Notifier to manage the Dark Mode state.
class DarkModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle(bool isDark) {
    state = isDark;
  }
}

/// Provider to track whether dark mode is currently active.
final darkModeProvider = NotifierProvider<DarkModeNotifier, bool>(DarkModeNotifier.new);
