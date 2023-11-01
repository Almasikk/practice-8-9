import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final http.Client httpClient;

  AuthRepository({required this.httpClient});

  Future<Map<String, dynamic>?> auth(String email, String password) async {
    final response = await httpClient.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      for (var user in data) {
        if (user['email'] == email && password == 'test') {
          return {
            'id': user['id'] ?? '',
            'name': user['name'],
            'username': user['username'],
            'website': user['website'],
            'phone': user['phone'],
            'street': user['address']['street'],
            'suite': user['address']['suite'],
            'city': user['address']['city']
          };
        }
      }
    }
    return null;
  }
}
