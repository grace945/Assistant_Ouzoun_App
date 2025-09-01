import 'package:assistantapp/core/constances/colors.dart';
import 'package:assistantapp/view/setting/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/settings_item_model.dart';
import '../controller/settings_controller.dart';
import '../settings_widget/settings_appbar.dart';
import '../settings_widget/settings_data.dart';
import '../settings_widget/settings_user_data.dart';

class SettingMainScreen extends StatefulWidget {
  const SettingMainScreen({super.key});

  @override
  State<SettingMainScreen> createState() => _SettingMainScreenState();
}

class _SettingMainScreenState extends State<SettingMainScreen> {
  final SettingsController controller = Get.find();
  @override
  void initState() {
    super.initState();
    controller.userData();
  }

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.find();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => SettingsUserData(
                  controller: controller,
                  userName: controller.name.value,
                  userEmail: controller.email.value,
                  number: controller.number.value,
                  image:
                      (controller.profileImage.value != null &&
                          controller.profileImage.value.isNotEmpty)
                      ? controller.profileImage.value
                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwf9i0J-G6U4eYtpj8mdTMeUoONoWK4g2w1JuUmRw-5_1ffkJ1sa8lhqogoq5xyBzFDIY&usqp=CAU",
                ),
              ),
              SizedBox(height: 15),
              SettingsData(
                item: [
                  SettingsItemModel(
                    icon: Icons.settings,
                    itemName: "Public",
                    onTap: () {},
                  ),

                  SettingsItemModel(
                    icon: Icons.dark_mode_outlined,
                    itemName: "App mode",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Choose App Theme"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.brightness_5),
                                  title: Text("Light"),
                                  onTap: () {
                                    controller.changeTheme("light");
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.dark_mode_outlined),
                                  title: Text("Dark"),
                                  onTap: () {
                                    controller.changeTheme("dark");
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  SettingsItemModel(
                    icon: Icons.person,
                    itemName: "Profile",
                    onTap: () {
                      Get.to(ProfilePage());
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              SettingsData(
                item: [
                  SettingsItemModel(
                    icon: Icons.tune,
                    itemName: "Extra Settings",
                    onTap: () {},
                  ),
                  SettingsItemModel(
                    icon: Icons.notifications_active,
                    itemName: "Notifications".tr,
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          color: isDarkMode ? Colors.white10 : Colors.black38,
                          padding: EdgeInsets.all(16),
                          child: Obx(
                            () => ListTile(
                              leading: Icon(
                                Icons.notifications_active,
                                color: green,
                              ),
                              title: Text(
                                "Enable Notifications",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: Switch(
                                value: controller.notificationsEnabled.value,
                                onChanged: (val) {
                                  controller.toggleNotifications(val);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SettingsItemModel(
                    icon: Icons.star_rate_sharp,
                    itemName: "Ratings",
                    onTap: () {
                      Get.toNamed('/evaluation');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              SettingsData(
                item: [
                  SettingsItemModel(
                    icon: Icons.arrow_back,
                    itemName: "Leave",
                    onTap: () {},
                  ),
                  SettingsItemModel(
                    icon: Icons.logout,
                    itemName: "Logout",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Confirm Logout"),
                            content: Text("Are you sure you want to log out?"),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: Text("Logout"),
                                onPressed: () async {
                                  await controller.logout();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
