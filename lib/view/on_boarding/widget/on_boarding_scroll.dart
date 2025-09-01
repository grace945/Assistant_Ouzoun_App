import 'package:assistantapp/Routes/AppRoutes.dart';
import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingScroll extends StatelessWidget {
  final PageController splashController;
  final bool onLastPage;
  const OnBoardingScroll({super.key,required this.splashController,required this.onLastPage});

  @override
  Widget build(BuildContext context) {
    return   Container(
        alignment: Alignment(0, 0.85),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child:Text("skip".tr,
                textAlign: TextAlign.center,
                style:Theme.of(context).textTheme.headlineSmall,),
              onTap: (){
                Get.toNamed(AppRoutes.login);
              },
            ),
            SmoothPageIndicator(
              controller: splashController,
              count: 3,
              effect: WormEffect(
                dotHeight:10 ,
                activeDotColor: greenlight,
                dotColor: Colors.grey,
              ),
            ),
            onLastPage?
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
        ));
  }
}
