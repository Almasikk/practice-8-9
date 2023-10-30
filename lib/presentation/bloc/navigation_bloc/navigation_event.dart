part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class ChangePage extends NavigationEvent {
  final int index;

  ChangePage({required this.index});
}
