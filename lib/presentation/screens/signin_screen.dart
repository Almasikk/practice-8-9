import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice9/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:practice9/presentation/widgets/bottom_navbar.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                final email = emailController.text;
                final password = passwordController.text;
                if (email.isNotEmpty && password == 'test') {
                  context.read<AuthBloc>().add(
                        SignInEvent(email: email, password: password),
                      );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid email or password'),
                    ),
                  );
                }
              },
              child: const Text('Sign In'),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is LoadedState) {
                  final userData = state.userData;
                  Future.microtask(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavbar(
                          name: userData['name'],
                          username: userData['username'],
                          phone: userData['phone'],
                          website: userData['website'],
                          id: userData['id'],
                          street: userData['street'],
                          suite: userData['suite'],
                          city: userData['city'],
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
    );
  }
}
