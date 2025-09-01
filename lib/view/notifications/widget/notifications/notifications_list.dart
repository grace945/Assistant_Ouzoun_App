import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/grouped_notification_response.dart';
import '../../controller/notification_controller.dart';
import 'notification_section.dart';



class NotificationList extends StatelessWidget {
  final List<GroupedNotificationResponse> response;

  const NotificationList({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    NotificationController _controller = Get.find();
    return Obx(()=> ListView.builder(
        itemCount: response.length,
        itemBuilder: (context, index) {
          final dateGroup = response[index];
          final date = dateGroup.createdAt;
          final items = dateGroup.notifications ;

          return SlideTransition(
            position:_controller.offsets[index],
              child: NotificationDateSection(date: date, items: items));
        },
      ),
    );
  }
}
