part of 'auth_bloc.dart';

abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class LoadedState extends AuthState {
  final List<User> users;
  LoadedState({required this.users});
}

class ErrorState extends AuthState {}
