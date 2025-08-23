import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Routes/AppRoutes.dart';

class Checkemailcontroller extends GetxController {
  late TextEditingController checkemail;
  late GlobalKey<FormState> keyForm;
  void CheckEmail() {}
  void GoToVrefiy() {
    Get.toNamed(AppRoutes.code);
  }

  @override
  void onInit() {
    super.onInit();
    checkemail = TextEditingController();
    keyForm = GlobalKey<FormState>();
  }
}
