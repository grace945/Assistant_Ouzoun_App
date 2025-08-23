import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String?userName;
  String? email;
  String?phoneNumber;
  String? roles;

  UserModel({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
