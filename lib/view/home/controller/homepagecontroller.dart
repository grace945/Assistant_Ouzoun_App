import 'package:get/get.dart';

class Homepagecontroller extends GetxController {
  void goToAppointmentPage(){
    Get.toNamed('/appiontment');
  }
  void goToSchedulePage(){
   Get.toNamed('/schedule');
  }
  void goToNotesPage(){
   Get.toNamed('/evaluation');
  }

}