

import 'package:assistantapp/view/setting/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Welcomeheader extends StatelessWidget {
   Welcomeheader({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller=Get.find();
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
      "HI Doctor,${controller.name}! 👋",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    SizedBox(height: 8),
    Text(
    "Ready to manage your schedule and tasks today?",
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
          ),
    ],
    );
  }
}
