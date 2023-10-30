part of 'navigation_bloc.dart';

abstract class NavigationState {}

class InitialNavigationState extends NavigationState {}

class LoadedNavigationState extends NavigationState {
  final int index;

  LoadedNavigationState({required this.index});
}

class LoadingNavigationState extends NavigationState {}
