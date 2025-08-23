
import 'package:assistantapp/core/class/inputvalidator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../core/constances/colors.dart';
import '../../../widgets/custom_widgets/CustomButton.dart';
import '../../../widgets/custom_widgets/CustomTextForm.dart';
import '../controller/checkemailcontroller.dart';

class Chekemail extends StatelessWidget {
  const Chekemail({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery=MediaQuery.of(context);
     final width=mediaQuery.size.width;
     final height=mediaQuery.size.height;
    Checkemailcontroller controller=Get.find();
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background ,
      body:SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical:height*0.15,horizontal:width*0.06),
            child:Container(
              width:width,
              height:height,
              alignment: Alignment.center,
              child: Form(
                key: controller.keyForm,
                child: Column(children: [
                  Icon(FontAwesomeIcons.envelopeCircleCheck,color:green, size: width * 0.2,),
                  SizedBox(height:height * 0.03),
                  Text("Forget Password?",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: height * 0.02),
                  Text("Please Enter your email to check\nif it is available ",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
                  SizedBox(height:height * 0.05),
                  CustomTextForm(
                    hinttext:"Enter your Email",
                    suffixIcon:Icon(Icons.email_outlined),
                    obscureText:false,
                    mycontroller:controller.checkemail,
                    validator:(val) {
                    return InputValidator.validatePassword(val);
                    },

                  ),
                  SizedBox(height:height * 0.05),
                  Custombutton(
                    color:green,
                    text:"Save",
                    onTap:(){
                    controller.GoToVrefiy();
                  },)

                ],),
              ),
        
        ),
        ),
      ),
    );
  }
}
