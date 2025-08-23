
import 'package:json_annotation/json_annotation.dart';
part  'login-request.g.dart';
@JsonSerializable()
class loginRequest {
  String email;
  String password;
  String deviceToken;

  loginRequest({required this.email, required this.password, required this.deviceToken});
  factory loginRequest.fromjson(Map<String,dynamic>json)=>_$loginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$loginRequestToJson(this);
}