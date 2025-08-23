// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enable_notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnableNotificationsModel _$EnableNotificationsModelFromJson(
  Map<String, dynamic> json,
) => EnableNotificationsModel(
  json['deviceToken'] as String,
  json['optIn'] as bool,
);

Map<String, dynamic> _$EnableNotificationsModelToJson(
  EnableNotificationsModel instance,
) => <String, dynamic>{
  'deviceToken': instance.deviceToken,
  'optIn': instance.optIn,
};
