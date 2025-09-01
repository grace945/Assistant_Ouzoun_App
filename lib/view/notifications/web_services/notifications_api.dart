import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/device_token_request.dart';
import '../model/enable_notifications_model.dart';
import '../model/grouped_notification_response.dart';
import '../model/notifications_model.dart';
part 'notifications_api.g.dart';

@RestApi(baseUrl:"http://ouzon.somee.com/api/")
abstract class NotificationsApi {
  factory NotificationsApi(Dio dio,{String baseUrl})=_NotificationsApi;
  @PATCH("Notifications")
  Future<Response>enableNotifications(@Body()  EnableNotificationsModel body,@Header("Authorization") String token);
  @POST("Notifications/CurrnetUserNotifications")
  Future<List<GroupedNotificationResponse>> getCurrentUserNotifications(
      @Body() DeviceTokenRequest request,
      );
}