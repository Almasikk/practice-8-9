import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int id;
  final String name;
  final String street;
  final String suite;
  final String city;

  const HomePage({
    Key? key,
    required this.id,
    required this.name,
    required this.street,
    required this.suite,
    required this.city,
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
                          title: const Text('ID'),
                          subtitle: Text(id.toString()),
                        ),
                        ListTile(
                          title: const Text('Name'),
                          subtitle: Text(name),
                        ),
                        ListTile(
                          title: const Text('Street/Suite '),
                          subtitle: Text("$street, $suite"),
                        ),
                        ListTile(
                          title: const Text('City'),
                          subtitle: Text(city),
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
