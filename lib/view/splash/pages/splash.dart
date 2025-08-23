import 'dart:async';

import 'package:assistantapp/core/constances/imagesurl.dart';
import 'package:assistantapp/view/splash/widget/splashdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Routes/AppRoutes.dart';
import '../../../core/constances/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  PageController splashController=PageController();
  bool onlastPage=false;
  @override
  Widget build(BuildContext context) {
    @override
    MediaQueryData _mediaQuery= MediaQuery.of(context);
    final height= _mediaQuery.size.height;
    final width =_mediaQuery.size.width;
    final isportrait=_mediaQuery.orientation==Orientation.portrait;
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          PageView(
            controller: splashController,
            onPageChanged: (index){
              setState(() {
                onlastPage=(index==2);
              });
            },
            children: [
              Splashdetails(title:"Welcome to Your Assistant App".tr,body: "Smart scheduling and seamless coordination with dental professionals".tr,url:Imagesurl.team),
              Splashdetails(title:"Stay in Sync with Your Dentist".tr,body: "Manage appointments, stay updated, and never miss a booking".tr,url:Imagesurl.docotr),
              Splashdetails(title:"Your Day, Organized".tr,body: "View upcoming bookings and manage your time with ease".tr,url:Imagesurl.appointment),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child:Text("skip".tr,
                      textAlign: TextAlign.center,
                      style:Theme.of(context).textTheme.headlineSmall,),
                    onTap: (){
                      splashController.jumpToPage(2);
                    },
                  ),
                  SmoothPageIndicator(
                    controller: splashController,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: greenlight,
                      dotColor: Colors.grey,
                    ),
                  ),
                  onlastPage?
                  GestureDetector(
                    onTap: (){
                     Get.toNamed(AppRoutes.login);
                    },
                    child:  Text("done".tr,
                      textAlign: TextAlign.center,
                      style:Theme.of(context).textTheme.headlineSmall,),
                  ):
                  GestureDetector(
                      onTap: (){
                        splashController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut );
                      },
                      child:  Text("next".tr,
                        textAlign: TextAlign.center,style:Theme.of(context).textTheme.headlineSmall,)
                  ),
                ],
              )),
        ],
      ),
    );
  }
}