
import 'package:assistantapp/view/home/pages/home_page_screen.dart';
import 'package:assistantapp/view/on_boarding/pages/on_boarding.dart';
import 'package:assistantapp/view/scheduling/pages/display-schedule-off-days.dart';
import 'package:assistantapp/view/scheduling/pages/schedule_screen.dart';
import '../view/Login_View/pages/login_screen.dart';
import '../view/appointment/pages/details/appointment_details.dart';
import '../view/appointment/pages/details/upcoming_appointment.dart';
import '../view/evaluation/pages/evaluation_page.dart';
import '../view/setting/pages/setting_main_screen.dart';

import 'AppRoutes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => OnBoarding()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),

    GetPage(name: AppRoutes.ScheduleScreen, page: () => ScheduleScreen()),
    GetPage(name: AppRoutes.Homepagescreen, page: () => HomePageScreen()),
    GetPage(
      name: AppRoutes.appiontmentdetails,
      page: () => Appointmentdetails(
        id: Get.arguments['id'], procedureid:Get.arguments['procedureid']
      ),
    ),
      GetPage(name: AppRoutes.appiontenthome, page: () =>UpcomingAppointment()),
    GetPage(name: AppRoutes.settings, page: () =>SettingMainScreen()),
    GetPage(name: AppRoutes.evaluation, page: ()=>EvaluationScreen()),
    GetPage(name: AppRoutes.displayvacation, page: ()=>DisplayVacation()),
    /*GetPage(name: AppRoutes.notification, page: ()=>NotificationDetailsView(notification: Get.arguments as AppNotification)),*/

  ];
}
