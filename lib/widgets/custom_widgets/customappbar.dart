import 'package:assistantapp/view/setting/controller/settingscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constances/colors.dart';


class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  Customappbar({super.key,required this.title,required this.subtitle});
 String title;
 String subtitle;
  @override
  Size get preferredSize => const Size.fromHeight(70); // نفس ارتفاع AppBar

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.find();
    return AppBar(
      backgroundColor: green,
      elevation: 0,
      toolbarHeight: 70,
      titleSpacing: 16,
      title: Row(
        children: [
          Obx(() => CircleAvatar(
              radius: 30,
              backgroundImage: controller.imageFile.value != null
                  ? FileImage(controller.imageFile.value!)
                  : const AssetImage('assets/images/default_avatar.jpg')
              as ImageProvider,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

