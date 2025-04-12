part of 'navigation_bloc.dart';

class NavigationState {
  final int selectedIndex;
  final String currentRouteName;

  const NavigationState({
    required this.selectedIndex,
    required this.currentRouteName,
  });

  NavigationState copyWith({
    int? selectedIndex,
    String? currentRouteName,
  }) {
    return NavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentRouteName: currentRouteName ?? this.currentRouteName,
    );
  }
}
