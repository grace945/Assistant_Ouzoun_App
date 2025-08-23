import 'package:assistantapp/core/services/api/notifications_api.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../core/services/helper.dart';
import '../../../models/notification_model/device_token_request.dart';
import '../../../models/notification_model/grouped_notification_response.dart';
import '../../../models/notification_model/notifications_model.dart';

class NotificationController extends GetxController with GetTickerProviderStateMixin  {
  var isLoading = true.obs;
  var notificationGroups = <GroupedNotificationResponse>[].obs;
  List<GroupedNotificationResponse> originalNotification=[];
  var errorMessage = ''.obs;
  late NotificationsApi  _apiService;
  final List<AnimationController> controllers = [];
  final List<Animation<Offset>> offsets = [];
  bool _isDisposed = false;
  @override
  void onInit() {
    super.onInit();
    _apiService =  NotificationsApi( Dio(
      BaseOptions(
        contentType: "application/json",

      ),
    ),);
    fetchNotifications();
    _initAnimations();
  }

  Future<void> fetchNotifications() async {
    try {
      isLoading(true);
      errorMessage('');
      final helper _prefsHelper = Get.find<helper>();
      final String? fireBaseToken = _prefsHelper.prefs.getString("fireBaseToken");
      final requestBody = DeviceTokenRequest(deviceToken:fireBaseToken! );
      final response = await _apiService.getCurrentUserNotifications(requestBody);
      notificationGroups.assignAll(response);
      _initAnimations();
    } on DioException catch (e) {
      errorMessage('Failed to load notifications: ${e.message}');
      print("Dio Error: ${e.message}");
    } catch (e) {

      errorMessage('An unexpected error occurred: $e');
      print("Generic Error: $e");
    } finally {
      isLoading(false);
    }
  }
  void _initAnimations() {
    controllers.forEach((c) => c.dispose());
    controllers.clear();
    offsets.clear();
    for (int i = 0; i < notificationGroups.length; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );
      final offsetAnimation =
      Tween<Offset>(
        begin: const Offset(
          0.0,
          0.5,
        ),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
      );

      controllers.add(controller);
      offsets.add(offsetAnimation);

      Future.delayed(Duration(milliseconds: i * 150), () {
        if (!_isDisposed) controllers[i].forward();
      });
    }
  }
}

