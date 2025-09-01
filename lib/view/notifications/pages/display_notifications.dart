import 'package:assistantapp/core/class/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/notification_controller.dart';
import '../widget/notifications/notifications_list.dart';
import 'package:lottie/lottie.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController _controller = Get.find();
  @override
  void initState() {
    super.initState();
    _controller.fetchNotifications();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Obx(()
    {
      if (_controller.isLoading.value) {
        return Center(
          child: Lottie.asset(
            'assets/animations/Animation - 1740348375718.json',
            fit: BoxFit.cover,
            repeat: true,
            height: 150,
            width: 150,
          ),
        );

      }

      if (_controller.errorMessage.isNotEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Error: ${_controller.errorMessage.value}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          ),
        );
      }

      return NotificationList(response: _controller.notificationGroups);
      }
    ),

    );
  }
}
