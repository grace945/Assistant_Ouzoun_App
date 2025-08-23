// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

loginResponse _$loginResponseFromJson(Map<String, dynamic> json) =>
    loginResponse(
      token: json['token'] as String?,
      username: json['username'] as String?,
      expires: (json['expires'] as num?)?.toInt(),
      refreshToken: json['refreshToken'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$loginResponseToJson(loginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'username': instance.username,
      'expires': instance.expires,
      'refreshToken': instance.refreshToken,
      'role': instance.role,
    };
