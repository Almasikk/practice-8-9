import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String username;
  final String phone;
  final String website;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.username,
    required this.phone,
    required this.website,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
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
                          title: const Text('Name'),
                          subtitle: Text(name),
                        ),
                        ListTile(
                          title: const Text('Username'),
                          subtitle: Text(username),
                        ),
                        ListTile(
                          title: const Text('Phone'),
                          subtitle: Text(phone),
                        ),
                        ListTile(
                          title: const Text('Website'),
                          subtitle: Text(website),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
