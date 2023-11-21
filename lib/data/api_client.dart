import 'package:dio/dio.dart';
import 'package:practice_nine/presentation/models/user.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/users/')
  Future<List<User>> getUsers(
    @Query('email') String email,
    @Query('password') String password,
  );
}
