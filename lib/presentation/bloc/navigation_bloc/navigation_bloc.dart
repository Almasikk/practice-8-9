import 'package:bloc/bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(InitialNavigationState()) {
    on<ChangePage>((event, emit) async {
      emit(LoadedNavigationState(index: event.index));
    });
  }
}
