

import 'package:assistantapp/core/services/notifications/local_notification_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../helper.dart';

class FirebaseServices {
  static FirebaseMessaging messaging=FirebaseMessaging.instance;
  static Future init()async{
    String? fireBaseToken=await messaging.getToken();
    print("firebasetoken$fireBaseToken");
    saveToken(fireBaseToken!);
   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
  }


  static void saveToken(String token){
    final helper _prefsHelper = Get.find<helper>();
    _prefsHelper.prefs.setString("fireBaseToken",token);
  }

}