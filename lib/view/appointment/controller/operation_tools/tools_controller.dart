
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../web_services/appiontment_api.dart';
import '../../../../core/services/helper.dart';
import '../../model/get_tool_data_model.dart';


class ToolsController extends GetxController {
  RxList<Tool>tools=<Tool>[].obs;
  late final AppiontmentApi _api;
  RxBool isLoading=true.obs;
  @override
  void onInit() {
    _api = AppiontmentApi(Dio(BaseOptions(
      contentType: "application/json",
      validateStatus: (_) => true,
    )));
  }

  Future<void> loadRequiredTools(String id) async {
    isLoading=true.obs;
    tools.clear();
    final helper _prefesHelper = Get.find<helper>();
    String? token = _prefesHelper.prefs.getString("token");

    try {
      final response = await _api.getAppiontmentById(id, "Bearer $token");
      if (response.requiredTools != null && response.requiredTools!.isNotEmpty) {
        for (var tool in response.requiredTools!) {
          print("response tool: ${tool.name}");
          tools.add(tool);

        }
      } else {
        tools.clear();
        Get.snackbar("Info", "No Required Tools Found");
      }
    } catch (e) {
      Get.snackbar("📛 Error", "$e");
      print("📛 Error+$e");
    }finally{
      isLoading.value=false;
    }
  }

}
