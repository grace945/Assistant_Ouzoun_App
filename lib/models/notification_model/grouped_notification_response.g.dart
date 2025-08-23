// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupedNotificationResponse _$GroupedNotificationResponseFromJson(
  Map<String, dynamic> json,
) => GroupedNotificationResponse(
  createdAt: DateTime.parse(json['createdAt'] as String),
  notifications: (json['notifications'] as List<dynamic>)
      .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GroupedNotificationResponseToJson(
  GroupedNotificationResponse instance,
) => <String, dynamic>{
  'createdAt': instance.createdAt.toIso8601String(),
  'notifications': instance.notifications,
};
