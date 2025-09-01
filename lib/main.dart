
import 'package:assistantapp/core/services/notifications/local_notification_services.dart';
import 'package:assistantapp/view/general_home/general_home.dart';
import 'package:assistantapp/view/setting/controller/settings_controller.dart';
import 'package:assistantapp/view/splash/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Binding/initalize_Binding.dart';
import 'Routes/AppPages.dart';
import 'core/constances/theme.dart';
import 'core/localization/translations.dart';
import 'core/services/notifications/firebase_services.dart';
import 'core/services/helper.dart';
import 'core/services/notifications/notifications_helper.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessaging(RemoteMessage message) async {
  await NotificationHelper.increaseCount();
  LocalNotificationService.showBasicNotification(message);
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value){
    FirebaseMessaging.instance.requestPermission();
    LocalNotificationService.init();
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
  });
  FirebaseServices.init();
  runApp( MyApp());
}



class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final controller = Get.put(SettingsController());

   Future<String> checkToken() async {
     final helper prefsHelper = Get.find<helper>();
     final token = prefsHelper.prefs.getString("token");
     await Future.delayed(Duration(milliseconds: 300));
     return token ?? "";
   }



   @override
  Widget build(BuildContext context) {

    return Obx(()=> GetMaterialApp(
              initialBinding: InitalizeBinding(),
              translations: MyTranslatin(),
              getPages: AppPages.pages,
              locale: controller.Lang,
              themeMode: controller.mode.value,
              theme: lightMode,
              darkTheme: darkMode,
              debugShowCheckedModeBanner: false,
            home: FutureBuilder<String>(
        future: checkToken(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          final token = snapshot.data!;
          if (token.isEmpty) {
            return const SplashScreen();
          } else {
            return const MyHomePage(title: '');
          }
        },
      ),
    )
    );
  }

}

