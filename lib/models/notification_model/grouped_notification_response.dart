// models/grouped_notification_response.dart

import 'package:json_annotation/json_annotation.dart';

import 'notifications_model.dart';
 // استيراد النموذج السابق

part 'grouped_notification_response.g.dart';

@JsonSerializable()
class GroupedNotificationResponse {
  final DateTime createdAt;
  final List<NotificationModel> notifications;

  GroupedNotificationResponse({
    required this.createdAt,
    required this.notifications,
  });

  factory GroupedNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupedNotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupedNotificationResponseToJson(this);
}
