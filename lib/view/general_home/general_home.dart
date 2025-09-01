import 'dart:developer';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:assistantapp/core/class/custom_drawer.dart';
import 'package:assistantapp/core/constances/colors.dart';
import 'package:assistantapp/view/scheduling/models/vacation-status.dart';
import 'package:assistantapp/view/home/pages/home_page_screen.dart';
import 'package:assistantapp/view/notifications/pages/display_notifications.dart';
import 'package:assistantapp/view/scheduling/controller/schedule_controller.dart';
import 'package:assistantapp/view/scheduling/pages/display-schedule-off-days.dart';
import 'package:assistantapp/view/setting/pages/setting_main_screen.dart';
import 'package:assistantapp/core/class/custom_app_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import '../../core/services/notifications/local_notification_services.dart';
import '../../core/services/notifications/notifications_helper.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  int _bottomNavIndex = 0;
  int notificationCount = 0;

  late final AnimationController _hideBottomBarAnimationController;

  final List<Widget> pages = const [
    HomePageScreen(),
    DisplayVacation(),
    NotificationScreen(),
    SettingMainScreen(),
  ];

  final iconList = <IconData>[
    Icons.home,
    Icons.schedule,
    Icons.add_alert,
    Icons.settings
  ];

  final labels = [
    "Home",
    "Off_days",
    "Notifications",
    "Settings",
  ];

  @override
  void initState() {
    super.initState();
    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    loadCount();
    listenToNotifications();
  }

  Future<void> loadCount() async {
    int count = await NotificationHelper.getCount();
    setState(() {
      notificationCount = count;
    });
  }

  void listenToNotifications() {
    log("start listen");
    FirebaseMessaging.onMessage.listen((message) async {
      log("Foreground message: ${message.data}");
      await NotificationHelper.increaseCount();
      int count = await NotificationHelper.getCount();
      setState(() {
        notificationCount = count;
      });
      LocalNotificationService.showBasicNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      log("onMessageOpenedApp: ${message.data}");
      await NotificationHelper.increaseCount();
      int count = await NotificationHelper.getCount();
      setState(() {
        notificationCount = count;
      });
      LocalNotificationService.showBasicNotification(message);
    });
  }

  @override
  void dispose() {
    _hideBottomBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  _bottomNavIndex == 0
          ? CustomAppBar(title: "Welcome Doctor", subtitle: 'Manage your tasks easily',)
          : _bottomNavIndex == 1
          ? CustomAppBar(title: "Off_Days", subtitle: 'your off_days you have requested is here',showFilter: true,showsearch: false,onFilterTap:() {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Filter by Status"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Pending"),
                    onTap: () {
                      Get.find<schedulecontroller>().selectedStatus.value =
                          VacationStatus.pending;
                      Navigator.pop(ctx);
                    },
                  ),
                  ListTile(
                    title: const Text("Accepted"),
                    onTap: () {
                      Get.find<schedulecontroller>().selectedStatus.value =
                          VacationStatus.Accepted;
                      Navigator.pop(ctx);
                    },
                  ),
                  ListTile(
                    title: const Text("Rejected"),
                    onTap: () {
                      Get.find<schedulecontroller>().selectedStatus.value =
                          VacationStatus.rejected;
                      Navigator.pop(ctx);
                    },
                  ),
                  ListTile(
                    title: const Text("All"),
                    onTap: () {
                      Get.find<schedulecontroller>().selectedStatus.value = null;
                      Navigator.pop(ctx);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },)
          : _bottomNavIndex == 2
          ? CustomAppBar(title: "Notification", subtitle: 'this is your notification',)
          : CustomAppBar(title: "Settings", subtitle: '',),
      drawer: CustomDrawer(),
      extendBodyBehindAppBar: _bottomNavIndex == 0,
      body: pages[_bottomNavIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 70,
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final bool isMiddle = index == 2;
          final color = isActive ? Colors.white : Colors.grey;
          final bgColor = isActive ? green : Colors.transparent;

          return FittedBox(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    margin: EdgeInsets.only(top: isMiddle ? 0 : 10),
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.all(isMiddle ? 15 : 8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          iconList[index],
                          size: isMiddle ? 30 : 24,
                          color: color,
                        ),
                        if (index == 2 && notificationCount > 0)
                          Positioned(
                            right: -6,
                            top: -6,
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: Text(
                                notificationCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AutoSizeText(
                      labels[index],
                      maxLines: 1,
                      style: TextStyle(
                        color: isActive ? green : Colors.grey,
                        fontWeight: isMiddle ? FontWeight.bold : FontWeight.normal,
                      ),
                      group: autoSizeGroup,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        activeIndex: _bottomNavIndex,
        splashColor: green,
        notchAndCornersAnimation: CurvedAnimation(
          parent: _hideBottomBarAnimationController,
          curve: Curves.easeInOut,
        ),
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.none,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) async {
          setState(() {
            _bottomNavIndex = index;
          });
          if (index == 2) {
            await NotificationHelper.resetCount();
            setState(() {
              notificationCount = 0;
            });
          }
        },
        hideAnimationController: _hideBottomBarAnimationController,
      ),
    );
  }
}
