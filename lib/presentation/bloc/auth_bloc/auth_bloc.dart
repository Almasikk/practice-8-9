import 'package:bloc/bloc.dart';
import 'package:practice9/data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(InitialState()) {
    on<SignInEvent>((event, emit) async {
      emit(LoadingState());
      final userData = await authRepository.auth(event.email, event.password);
      if (userData != null) {
        emit(LoadedState(userData: userData));
      } else {
        emit(ErrorState());
      }
    });
  }
}
