import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice9/data/auth_repository.dart';
import 'package:practice9/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:practice9/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:practice9/presentation/screens/signin_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final AuthRepository authRepository =
      AuthRepository(httpClient: http.Client());
  final NavigationBloc navigationBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository: authRepository),
        ),
        BlocProvider<NavigationBloc>(
          create: (_) => navigationBloc,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
