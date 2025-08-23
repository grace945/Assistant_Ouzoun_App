import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../models/auth_model/login-request.dart';
import '../../../models/auth_model/login-response.dart';
import '../../../models/auth_model/refresh-token-request.dart';
import '../../../models/auth_model/user_model.dart';
part 'auth-api.g.dart';

@RestApi(baseUrl: "http://ouzon.somee.com/api/")
abstract class authApi {
  factory authApi(Dio dio, {String baseUrl}) = _authApi;

  @POST("users/login")
  Future<loginResponse> login(@Body() loginRequest request);
   @GET("users/current")
  Future<UserModel>userData(@Header("Authorization") String token);
  @POST("users/token/refresh")
  Future<loginResponse> refreshToken(@Body() RefreshTokenRequest request,@Header("Authorization") String Token);
}
