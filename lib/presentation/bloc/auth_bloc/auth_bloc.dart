import 'package:bloc/bloc.dart';
import 'package:practice9/data/auth_repository.dart';
import 'package:practice9/presentation/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(InitialState()) {
    on<SignInEvent>((event, emit) async {
      emit(LoadingState());
      final List<User> users =
          await authRepository.getUsers(event.email, event.password);
      if (users.isNotEmpty) {
        emit(LoadedState(users: users));
      } else {
        emit(ErrorState());
      }
    });
  }
}
