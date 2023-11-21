import 'package:flutter/material.dart';
import 'package:practice_nine/presentation/screens/signin_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SignInPage();
          } else {
            return const Center(
              child: Text(
                'Your Splash Screen',
                style: TextStyle(fontSize: 24.0),
              ),
            );
          }
        },
      ),
    );
  }
}
