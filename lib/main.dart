import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice9/data/api_client.dart';
import 'package:practice9/data/auth_repository.dart';
import 'package:practice9/data/firebase_api.dart';
import 'package:practice9/firebase_options.dart';
import 'package:practice9/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:practice9/presentation/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:practice9/presentation/screens/signin_screen.dart';
import 'package:practice9/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
