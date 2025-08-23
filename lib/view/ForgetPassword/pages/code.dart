
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../core/constances/colors.dart';
import '../../../widgets/custom_widgets/CustomButton.dart';
import '../../../widgets/custom_widgets/customotp.dart';
import '../controller/verfiycodecontroller.dart';


class Code extends StatelessWidget {
  const Code({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery=MediaQuery.of(context);
    final width=mediaQuery.size.width;
    final height=mediaQuery.size.height;
    Verfiycodecontroller controller=Get.find();
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:height*0.15,horizontal:width*0.06),
          child:Container(
            alignment: Alignment.center,
            child: Column(children: [
              Text("Enter Verification Code",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleLarge,),
              SizedBox(height:height * 0.02),
              Text("Enter the 5-digit that we have sent via the \nEmail ",textAlign: TextAlign.center,style:Theme.of(context).textTheme.titleMedium,),
              SizedBox(height: height * 0.04),
              Customotp(
                  onChanged:(code){
                controller.verifycode=code;
              },
                codenumber: 5,
                  focusedbordercolor: green,
                  cursorcolor: greenlight,
                keybord:TextInputType.number,
              ),
              SizedBox(height:height * 0.05),
              Custombutton(
                color:green,
                text:"Confirm",
                onTap:(){
                  controller.goToreset();
                },)
        
            ],),
        
          ),
        ),
      ),
    );
  }
}
