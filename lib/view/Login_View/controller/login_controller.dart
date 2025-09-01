import 'dart:async';
import 'package:assistantapp/core/services/helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constances/colors.dart';
import '../api_services/auth-api.dart';
import '../models/login-request.dart';
import '../models/refresh-token-request.dart';
import '../../general_home/general_home.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool passwordvisiblity = true.obs;
  var isLoading = false.obs;
  late final authApi _api;
  Timer? _refreshTimer;
  @override
  void onInit() {
    super.onInit();
    _api = authApi(
      Dio(
        BaseOptions(
          contentType: "application/json",
          validateStatus: (status) {
            return status != null && status < 300;
          },
        ),
      ),
    );
  }

  Future<void> loginUser(loginRequest model) async {
    try {
      isLoading.value = true;

      final response = await _api.login(model);

      if (response.token != null) {
        final token = response.token!;
        final helper _prefeshelpre = Get.find<helper>();
        _prefeshelpre.prefs.setString("token", token);
        _prefeshelpre.prefs.setString("refreshToken", response.refreshToken ?? "");

        Get.snackbar("✅ Done", "Login successfully");

        Get.offAll(MyHomePage(title: ''));
        _startRefreshTokenTimer();
      } else {
        Get.snackbar(
          "📛 Failed",
          "Error: ${response.toString()}",
          colorText: Colors.black,
          backgroundColor: green,
        );
      }
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;
      String errorMessage = "Something went wrong";
      if (responseData is Map<String, dynamic>) {
        errorMessage = responseData["message"] ?? responseData.toString();
      } else if (responseData != null) {
        errorMessage = responseData.toString();
      } else if (e.message != null) {
        errorMessage = e.message!;
      }
      Get.snackbar(
        "📛 Login Failed",
        "Error: $errorMessage",
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } catch (e) {
      print("📛 General Error: $e");
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> refreshTokenIfExpired() async {
    try {
      final helper _prefsHelper = Get.find<helper>();
      final String? oldRefreshToken = _prefsHelper.prefs.getString("refreshToken");
      final String? oldToken = _prefsHelper.prefs.getString("token");

      if (oldRefreshToken == null || oldToken == null) {
        Get.snackbar("📛 Error", "No refresh token or token found.");
        return;
      }

      final refreshModel = RefreshTokenRequest(refreshToken: oldRefreshToken);
      final newResponse = await _api.refreshToken(refreshModel, "Bearer $oldToken");

      if (newResponse.token == null || newResponse.refreshToken == null) {
        print("📛 Failed to get new tokens from server");
        Get.snackbar("Error", "Failed to refresh token");
        return;
      }

      _prefsHelper.prefs.setString("token", newResponse.token!);
      _prefsHelper.prefs.setString("refreshToken", newResponse.refreshToken!);
      print("✅ Token refreshed: ${newResponse.token}");
    } on DioException catch (e) {
      print("📛 Failed to refresh token");
      print("Status Code: ${e.response?.statusCode}");
      print("Response: ${e.response?.data}");
      Get.snackbar("Error", "Failed to refresh token");
    }
  }


  void _startRefreshTokenTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(Duration(minutes: 28), (timer) {
      print("🔄 Trying to refresh token...");
      refreshTokenIfExpired();
    });
  }
}
