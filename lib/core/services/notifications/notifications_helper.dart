import 'package:get/get.dart';
import '../../../core/services/helper.dart';

class NotificationHelper {
  static const _key = "notification_count";

  static Future<int> getCount() async {
    final helper prefs = Get.find<helper>();
    return prefs.prefs.getInt(_key) ?? 0;
  }

  static Future<void> increaseCount() async {
    final helper prefs = Get.find<helper>();
    int current = prefs.prefs.getInt(_key) ?? 0;
    await prefs.prefs.setInt(_key, current + 1);
  }

  static Future<void> resetCount() async {
    final helper prefs = Get.find<helper>();
    await prefs.prefs.setInt(_key, 0);
  }
}
