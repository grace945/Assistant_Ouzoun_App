import 'package:json_annotation/json_annotation.dart';

part 'login-response.g.dart';

@JsonSerializable()
class loginResponse {
  final String? token;
  final String? username;
  final int? expires;
  final String? refreshToken;
  final String? role;

  loginResponse({
    this.token,
    this.username,
    this.expires,
    this.refreshToken,
    this.role,
  });

  factory loginResponse.fromJson(Map<String, dynamic> json) =>
      _$loginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$loginResponseToJson(this);
}
