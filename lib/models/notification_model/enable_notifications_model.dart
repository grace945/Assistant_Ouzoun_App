import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'enable_notifications_model.g.dart';
@JsonSerializable()
class EnableNotificationsModel {
  String deviceToken;
  bool optIn;

  EnableNotificationsModel(this.deviceToken, this.optIn);
  factory EnableNotificationsModel.fromJson(Map<String, dynamic> json) => _$EnableNotificationsModelFromJson(json);


  Map<String, dynamic> toJson() => _$EnableNotificationsModelToJson(this);
}