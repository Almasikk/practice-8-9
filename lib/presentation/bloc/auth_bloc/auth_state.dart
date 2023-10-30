part of 'auth_bloc.dart';

abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class LoadedState extends AuthState {
  final Map<String, dynamic> userData;

  LoadedState({required this.userData});
}

class ErrorState extends AuthState {}
