import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder<Map<String, String>>(
            future: getUserDataFromSharedPreferences(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final Map<String, String> userData = snapshot.data!;
                return Column(
                  children: [
                    Expanded(
                      child: Card(
                        margin: const EdgeInsets.all(16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: const Text('Email'),
                                subtitle: Text(userData['email'] ?? 'N/A'),
                              ),
                              ListTile(
                                title: const Text('Password'),
                                subtitle: Text(userData['password'] ?? 'N/A'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Map<String, String>> getUserDataFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String email = prefs.getString('email') ?? 'N/A';
    final String password = prefs.getString('password') ?? 'N/A';
    return {'email': email, 'password': password};
  }
}
