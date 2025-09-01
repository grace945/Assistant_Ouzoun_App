import 'dart:io';
import 'package:assistantapp/view/setting/web_services/profile_api.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/constances/colors.dart';
import '../../Login_View/api_services/auth-api.dart';
import '../../notifications/web_services/notifications_api.dart';
import '../../../core/services/helper.dart';
import '../../notifications/model/enable_notifications_model.dart';

class SettingsController extends GetxController {
  var notificationsEnabled = true.obs;
  late helper services;
  Rx<ThemeMode> mode = ThemeMode.system.obs;
  Locale? Lang;
  RxBool isLoading = true.obs;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString number="".obs;
  RxString profileImage="".obs;
  var pickedImage = Rx<File?>(null);
  late final ProfileApi _api;
  late final NotificationsApi _notificationApi;


  void changLang(String language) {
    Locale locale = Locale(language);
    services.prefs.setString("lang", language);
    Lang = locale;
    Get.updateLocale(locale);
  }

  // Theme
  void changeTheme(String theme) {
    switch (theme) {
      case "light":
        mode.value = ThemeMode.light;
        break;
      case "dark":
        mode.value = ThemeMode.dark;
        break;
      default:
        mode.value = ThemeMode.system;
    }
    services.prefs.setString("theme", theme);
    Get.changeThemeMode(mode.value);
  }


  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) pickedImage.value = File(pickedFile.path);
  }

  // User data
  Future<void> userData() async {
    try {
      isLoading.value = true;
      final String? token = services.prefs.getString("token");
      if (token == null) return;
      final response = await _api.userData("Bearer $token");
      print("📛settings dataaaaaaaa ${response.userName}");
      if (response.id != null) {
        name.value = response.userName!;
        email.value = response.email!;
        number.value=response.phoneNumber!;
        profileImage.value=response.profileImagePath!;
      } else {
        Get.snackbar("📛 Failed", ":error $response",
            colorText: Colors.black, backgroundColor: green);
      }
    } catch (e) {
      if (e is DioException) {
        print("📛 Dio error:");
        print("Status Code: ${e.response?.statusCode}");
        print("Response Data: ${e.response?.data}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Notifications
  Future<void> checkNotficationsStatus() async {
    final status = await Permission.notification.status;
    notificationsEnabled.value = status.isGranted
        ? await FirebaseMessaging.instance.isAutoInitEnabled
        : false;
  }

  Future<void> toggleNotifications(bool value) async {
    if (value) {
      final status = await Permission.notification.status;
      if (!status.isGranted) {
        final result = await Permission.notification.request();
        if (!result.isGranted) {
          notificationsEnabled.value = false;
          Get.snackbar("⚠️ Notifications", "Permission denied");
          return;
        }
      }
    }

    notificationsEnabled.value = value;

    try {
      final String? fireBaseToken = services.prefs.getString("fireBaseToken");
      final String? authToken = services.prefs.getString("token");
      if (fireBaseToken == null || authToken == null) {
        Get.snackbar("❌ Error", "User data not found. Please log in again.");
        notificationsEnabled.value = !value;
        return;
      }

      final body = EnableNotificationsModel(fireBaseToken, value);
      final tokenHeader = "Bearer $authToken";
     final response= await _notificationApi.enableNotifications(body, tokenHeader);
     if(response.statusCode==200){
       Get.snackbar(
         "✅ Success",
         value
             ? "Notifications have been enabled."
             : "Notifications have been disabled.",
       );
     }else{
       Get.snackbar("error", "${response.statusCode}");
     }

    } catch (e) {
      notificationsEnabled.value = !value;
      Get.snackbar("📛 Error", "Failed to update notifications");
    }
  }

  // Logout
  Future<void> logout() async {
    await services.prefs.remove("token");
    Get.offAllNamed('/login');
  }
  @override
  void onReady() {
    super.onReady();
    userData();
  }
  @override
  void onInit() {
    super.onInit();
    userData();
    services = Get.find<helper>();
    _api = ProfileApi(Dio(BaseOptions(
      contentType: "application/json",
      validateStatus: (status) => true,
    )));
    _notificationApi = NotificationsApi(Dio());

     checkNotficationsStatus();

    // Theme
    final savedMode = services.prefs.getString("theme");
    if (savedMode != null) changeTheme(savedMode);

    // Language
    final myLang = services.prefs.getString("lang");
    Lang = myLang != null ? Locale(myLang) : Locale(Get.deviceLocale!.languageCode);
  }

  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied ||
        status.isRestricted ||
        status.isPermanentlyDenied) {
      await Permission.notification.request();
    }
  }

  Future<void> saveProfile(String? userName, String?Email,String? phoneNumber,) async {
    try {
      isLoading.value = true;
      final token = "Bearer ${services.prefs.getString("token")}";



      final updated = await _api.updateUserProfile(
        token,
        userName,
        Email,
        phoneNumber,
       pickedImage.value,
      );

      name.value=updated.userName!;
      email.value=updated.email!;
      number.value=updated.phoneNumber!;
      profileImage.value=updated.profileImagePath!;

      Get.snackbar("✅ Success", "Profile updated!");
    } catch (e) {
      print("❌ Error updating profile: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}


