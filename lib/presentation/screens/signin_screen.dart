import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_nine/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:practice_nine/presentation/widgets/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purpleAccent.shade700,
      ),
      backgroundColor: Colors.purpleAccent.shade700,
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(16, 100, 16, 100),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.purpleAccent.shade700,
                    ),
                  ),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    final email = emailController.text;
                    final password = passwordController.text;
                    if (email.isNotEmpty && password == 'test') {
                      context.read<AuthBloc>().add(
                            SignInEvent(email: email, password: password),
                          );
                      saveUserDataToSharedPreferences(
                        email: email,
                        password: password,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid email or password'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is LoadedState) {
                      final userData = state.users[0];
                      Future.microtask(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavbar(
                              name: userData.name,
                              username: userData.username,
                              phone: userData.phone,
                              website: userData.website,
                              id: userData.id,
                              street: userData.street,
                              suite: userData.suite,
                              city: userData.city,
                            ),
                          ),
                        );
                      });
                      return Container();
                    } else if (state is LoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is ErrorState) {
                      return const Text('Error occurred');
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveUserDataToSharedPreferences({
    required String email,
    required String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
  }
}
