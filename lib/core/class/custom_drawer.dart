import 'package:assistantapp/view/setting/controller/settings_controller.dart';
import 'package:get/get.dart';
import 'package:assistantapp/core/constances/theme.dart';
import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.find();
    bool isDark=Theme.of(context).brightness==darkMode.brightness;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(80),
        bottomRight: Radius.circular(80),
      ),
      child: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon:  Icon(Icons.arrow_back, color:isDark?Colors.white:Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      Obx(() => CircleAvatar(
                        radius: 50,
                        backgroundImage: controller.pickedImage.value != null
                            ? FileImage(controller.pickedImage.value!)
                            : const AssetImage('assets/images/default_avatar.jpg')
                        as ImageProvider,
                      ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.name.toString(),
                        style: TextStyle(
                          color: isDark? Colors.white:Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Text(
                        controller.email.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),

                // Menu items
                Expanded(
                  child: ListView(
                    children: [
                      _buildMenuItem(Icons.person, 'Edit Profile',context,(){}),
                      Divider(),
                      _buildMenuItem(Icons.settings, 'Settings',context,(){}),
                      Divider(),
                      _buildMenuItem(Icons.logout, 'Logout',context,(){}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String text,BuildContext context,final VoidCallback? onTap) {
    bool isDark=Theme.of(context).brightness==darkMode.brightness;
    return ListTile(
      leading: Icon(icon, color:isDark? Colors.white:Colors.black),
      title: Text(
        text,
        style:  TextStyle(color:isDark? Colors.white:Colors.black, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}