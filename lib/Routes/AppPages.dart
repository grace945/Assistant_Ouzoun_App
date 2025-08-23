
import 'package:assistantapp/view/home/pages/homepagescreen.dart';
import 'package:assistantapp/view/scheduleoffdays/pages/schedulescreen.dart';
import '../view/ForgetPassword/pages/chekemail.dart';
import '../view/ForgetPassword/pages/code.dart';
import '../view/ForgetPassword/pages/resetpasswordpage.dart';
import '../view/Login_View/pages/login_screen.dart';
import '../view/appointment/pages/details/appointment_details.dart';
import '../view/appointment/pages/details/upcomingappointment.dart';
import '../view/evaluation/pages/evaluation_page.dart';
import '../view/scheduleoffdays/pages/display-schedule-off-days.dart';
import '../view/setting/pages/setting_main_screen.dart';
import '../view/splash/pages/splash.dart';
import 'AppRoutes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.checkemail, page: () => Chekemail()),
    GetPage(name: AppRoutes.code, page: () => Code()),
    GetPage(name: AppRoutes.resetpage, page: () => Resetpasswordpage()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),

    GetPage(name: AppRoutes.Schedulescreen, page: () => Schedulescreen()),
    GetPage(name: AppRoutes.Homepagescreen, page: () => Homepagescreen()),
    GetPage(
      name: AppRoutes.appiontmentdetails,
      page: () => Appointmentdetails(
        id: Get.arguments['id'], procedureid:Get.arguments['procedureid']
      ),
    ),
      GetPage(name: AppRoutes.appiontenthome, page: () =>Upcomingappointment()),
    GetPage(name: AppRoutes.settings, page: () =>SettingMainScreen()),
    GetPage(name: AppRoutes.evaluation, page: ()=>EvaluationScreen()),
    GetPage(name: AppRoutes.displayvacation, page: ()=>VacationRequestPage()),
    /*GetPage(name: AppRoutes.notification, page: ()=>NotificationDetailsView(notification: Get.arguments as AppNotification)),*/

  ];
}
