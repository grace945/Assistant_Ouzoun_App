import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/login-request.dart';
import '../models/login-response.dart';
import '../models/refresh-token-request.dart';
import '../../setting/models/user_model.dart';
part 'auth-api.g.dart';

@RestApi(baseUrl: "http://ouzon.somee.com/api/")
abstract class authApi {
  factory authApi(Dio dio, {String baseUrl}) = _authApi;

  @POST("users/login")
  Future<loginResponse> login(@Body() loginRequest request);

  @POST("users/token/refresh")
  Future<loginResponse> refreshToken(@Body() RefreshTokenRequest request,@Header("Authorization") String Token);
}
