import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice9/data/api_client.dart';
import 'package:practice9/data/auth_repository.dart';
import 'package:practice9/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:practice9/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:practice9/presentation/screens/signin_screen.dart';

void main() {
  runApp(MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  late Dio dio;
  late ApiClient apiClient;
  late AuthRepository authRepository;
  late NavigationBloc navigationBloc;

  @override
  Widget build(BuildContext context) {
    dio = Dio();
    apiClient = ApiClient(dio);
    authRepository = AuthRepository(dio: dio, apiClient: apiClient);
    navigationBloc = NavigationBloc();
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
