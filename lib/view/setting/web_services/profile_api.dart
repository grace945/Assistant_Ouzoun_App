
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/user_model.dart';

part 'profile_api.g.dart';
@RestApi(baseUrl:"http://ouzon.somee.com/api/")
abstract class ProfileApi {
  factory ProfileApi(Dio dio,{String baseUrl})=_ProfileApi;
  @GET("users/current")
  Future<UserModel>userData(@Header("Authorization") String token);
  @MultiPart()
  @PUT("users/UpdateCurrentUserProfile")
  Future<UserModel> updateUserProfile(
      @Header("Authorization") String token,
      @Part(name: "UserName") String? userName,
      @Part(name: "Email") String? email,
      @Part(name: "PhoneNumber") String? phoneNumber,
      @Part(name: "Image") File? image,
      );

}