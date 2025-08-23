

import 'package:assistantapp/core/class/inputvalidator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/constances/colors.dart';
import '../../../widgets/custom_widgets/CustomButton.dart';
import '../../../widgets/custom_widgets/CustomTextForm.dart';
import '../controller/resetpagecontroller.dart';


class Resetpasswordpage extends StatelessWidget {
  const Resetpasswordpage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery=MediaQuery.of(context);
    final width=mediaQuery.size.width;
    final height=mediaQuery.size.height;
    resetpagecontroller controller=Get.find();
    return  Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background ,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:height*0.15,horizontal:width*0.06),
            child:Container(
              alignment: Alignment.center,
              child: Form(
                key: controller.key,
                child: Column(children: [
                  Icon(FontAwesomeIcons.key,color:green, size: width * 0.2,),
                  SizedBox(height:height * 0.03),
                  Text("Reset Password",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height:height * 0.02),
                  Text("Please Reset your Password to Access\nOuzoun App ",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height:height * 0.05),
                  Obx(()=> CustomTextForm(
                      hinttext:"Enter your Password",
                      suffixIcon:IconButton(
                          icon: Icon(controller.ispasswordhidden.value?Icons.visibility_off:Icons.visibility),
                        onPressed: (){
                            controller.ispasswordhidden.toggle();
                        },
                      ),
                      obscureText:controller.ispasswordhidden.value,
                      mycontroller:controller.resetPassword,
                      validator:(val) {
                        return InputValidator.validatePassword(val);
                      }
                    ),
                  ),
                  SizedBox(height:height * 0.05),
                  Obx(()=> CustomTextForm(
                      hinttext:"confirm your Password",
                      suffixIcon:IconButton
                        (
                          icon: Icon(
                              controller.isconfirmepasswordhidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility
                          ),
                        onPressed: (){
                            controller.isconfirmepasswordhidden.toggle();
                        },
                      ),
                      obscureText:controller.isconfirmepasswordhidden.value,
                      mycontroller:controller.confirmresetPassword,
                      validator:(val) {
                       return InputValidator.validatePassword(val);
                      },

                    ),
                  ),
                  SizedBox(height:height * 0.05),
                  Custombutton(
                    color:green,
                    text:"done",
                    onTap:(){
                   if(controller.key.currentState!.validate()){
                     controller.Homepagescreen();
                   }
                    },)
          
                ],),
              ),
          
            ),
          ),
        ),
      ),
    );
  }
}
