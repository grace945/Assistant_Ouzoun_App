
import 'package:get/get.dart';
import '../view/ForgetPassword/controller/checkemailcontroller.dart';
import '../view/ForgetPassword/controller/resetpagecontroller.dart';
import '../view/ForgetPassword/controller/verfiycodecontroller.dart';
import '../view/Login_View/controller/login_controller.dart';
import '../view/appointment/controller/appointment/appiontment_controller.dart';
import '../view/appointment/controller/operation_tools/implant_controller.dart';
import '../view/appointment/controller/operation_tools/surgical_kit_controller.dart';
import '../view/appointment/controller/operation_tools/tools_controller.dart';
import '../view/evaluation/controller/evaluation_controller.dart';
import '../view/home/controller/homepagecontroller.dart';
import '../view/notifications/controller/notification_controller.dart';
import '../view/scheduleoffdays/controller/schedulecontroller.dart';
import '../view/setting/controller/settingscontroller.dart';
import '../widgets/custom_widgets/custombottomnavcontroller.dart';


class InitalizeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => Checkemailcontroller(), fenix: true);
    Get.lazyPut(() => Verfiycodecontroller(), fenix: true);
    Get.lazyPut(() => resetpagecontroller(), fenix: true);
    Get.lazyPut(() => schedulecontroller(), fenix: true);
    Get.lazyPut(() => ApiontmentController(), fenix: true);
    Get.lazyPut(() => Homepagecontroller(), fenix: true);
    Get.lazyPut(() => BottomNavController(),fenix: true);
    Get.lazyPut(() => SettingsController(),fenix: true );
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => KitController(), fenix: true);
    Get.lazyPut(() => ToolsController(), fenix: true);
    Get.lazyPut(() =>  ImplantKitController(), fenix: true);
    Get.lazyPut(()=>ReviewController(),fenix: true);

  }
}


