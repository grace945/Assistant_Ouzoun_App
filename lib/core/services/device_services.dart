import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceService {
  static const _deviceIdKey = 'device_id';


  static Future<void> getDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    final deviceInfo = DeviceInfoPlugin();
    String deviceId;

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id ?? androidInfo.model ?? 'unknown-android-id';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? 'unknown-ios-id';
    } else {
      deviceId = 'unsupported-platform';
    }

    await prefs.setString(_deviceIdKey, deviceId);

   print("deviceId="+deviceId);
  }
}


