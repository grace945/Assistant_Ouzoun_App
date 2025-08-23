import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../../core/services/api/appiontment_api.dart';
import '../../../../core/services/helper.dart';
import '../../../../models/appointment_model/get_tool_data_model.dart' show SurgicalKit;



class KitController extends GetxController {
  Rx<SurgicalKit?> surgicalKit = Rx<SurgicalKit?>(null);
  late final AppiontmentApi _api;
  RxBool isLoading = true.obs;
  final List<AnimationController> controllers = [];
  final List<Animation<Offset>> offsets = [];
  @override
  void onInit() {
    _api = AppiontmentApi(Dio(BaseOptions(
      contentType: "application/json",
      validateStatus: (_) => true,
    )));
  }
  Future<void> loadKitData(String id) async {
    isLoading.value = true;
    final helper _prefesHelper = Get.find<helper>();
    String? token = _prefesHelper.prefs.getString("token");

    try {
      final response = await _api.getAppiontmentById(id, "Bearer $token");

      if (response.surgicalKits != null && response.surgicalKits!.isNotEmpty) {
        surgicalKit.value = response.surgicalKits!.first;
        print("Surgical Kit${surgicalKit.value!.name}");
        print("SurgicalKit${surgicalKit.value!.tools}");
      } else {
        surgicalKit.value = null;
        Get.snackbar("Info", "No Surgical Kits Found");
      }
    } catch (e) {
      Get.snackbar("📛 Error", "$e");
      surgicalKit.value = null;
    } finally {
      isLoading.value = false;
    }
  }


}




