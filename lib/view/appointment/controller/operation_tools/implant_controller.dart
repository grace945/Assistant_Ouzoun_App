import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../web_services/appiontment_api.dart';
import '../../../../core/services/helper.dart';
import '../../model/get_tool_data_model.dart';
class ImplantKitController extends GetxController {
  RxList<ImplantKit> implantKits = <ImplantKit>[].obs;
  late final AppiontmentApi _api;
  RxBool isLoading=true.obs;

  @override
  void onInit() {
    _api = AppiontmentApi(Dio(BaseOptions(
      contentType: "application/json",
      validateStatus: (_) => true,
    )));
  }
  Future<void> loadImplantKits(String id) async {
    isLoading.value=true;
    implantKits.clear();
    final helper _prefesHelper = Get.find<helper>();
    String? token = _prefesHelper.prefs.getString("token");
    final response = await _api.getAppiontmentById(id, "Bearer $token");
    try {
      if (response.implantKits != null && response.implantKits!.isNotEmpty) {
        print("response implantkit ${response.implantKits}");
        implantKits.assignAll(response.implantKits!);
        for(final data in implantKits){
          print("response implantkit ${data.implant}");
          print("response implantkitWithTool ${data.implant}");
        }
      } else {
        Get.snackbar("Info", "No Implant Kits Found");
      }
    } catch (e) {
      Get.snackbar("📛 Error", "$e");
      print("📛 Error+$e");
    }finally{
      isLoading.value=false;
    }
  }

}

