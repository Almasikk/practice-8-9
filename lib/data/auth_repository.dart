import 'package:dio/dio.dart';
import 'package:practice_nine/data/api_client.dart';
import 'package:practice_nine/presentation/models/user.dart';

class AuthRepository {
  final Dio dio;
  final ApiClient apiClient;

  AuthRepository({required this.dio, required this.apiClient});

  Future<List<User>> getUsers(String email, String password) async {
    final response = await apiClient.getUsers(email, password);
    return response;
  }
}
