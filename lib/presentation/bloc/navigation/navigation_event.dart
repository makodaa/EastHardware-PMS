part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationIndexChanged extends NavigationEvent {
  final int index;
  const NavigationIndexChanged({
    required this.index,
  });
}
