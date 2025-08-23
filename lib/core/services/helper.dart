import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class helper extends GetxService {

  late SharedPreferences prefs;

  Future<helper>initialize()async {
    prefs= await SharedPreferences.getInstance();
    return this;
  }
}

initialServices()async{
  await Get.putAsync(()=>helper().initialize());
}