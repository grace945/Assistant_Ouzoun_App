// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

loginRequest _$loginRequestFromJson(Map<String, dynamic> json) => loginRequest(
  email: json['email'] as String,
  password: json['password'] as String,
  deviceToken: json['deviceToken'] as String,
);

Map<String, dynamic> _$loginRequestToJson(loginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'deviceToken': instance.deviceToken,
    };
