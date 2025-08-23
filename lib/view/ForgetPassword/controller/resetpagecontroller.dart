import 'package:assistantapp/view/home/pages/homepagescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class resetpagecontroller extends GetxController{
  late TextEditingController resetPassword;
  late TextEditingController confirmresetPassword;
  var ispasswordhidden=true.obs;
  var isconfirmepasswordhidden=true.obs;
  late  GlobalKey<FormState>key;
  void Sucesspage(){

  }
  void Homepagescreen(){
     Get.offAllNamed('/home');
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    resetPassword=TextEditingController();
    confirmresetPassword=TextEditingController();
    key=GlobalKey<FormState>();
  }
}