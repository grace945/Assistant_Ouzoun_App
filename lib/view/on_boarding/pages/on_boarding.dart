import 'package:assistantapp/core/constances/imagesurl.dart';
import 'package:assistantapp/view/on_boarding/widget/on_boarding_details.dart';
import 'package:assistantapp/view/on_boarding/widget/on_boarding_scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController splashController = PageController();
  bool onlastPage = false;
  @override
  Widget build(BuildContext context) {
    @override
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    final height = _mediaQuery.size.height;
    final width = _mediaQuery.size.width;
    final isportrait = _mediaQuery.orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          PageView(
            controller: splashController,
            onPageChanged: (index) {
              setState(() {
                onlastPage = (index == 2);
              });
            },
            children: [
              OnBoardingDetails(
                title: "Welcome to Your Assistant App".tr,
                body:
                    "Smart scheduling and seamless coordination with dental professionals"
                        .tr,
                url: Imagesurl.team,
              ),
              OnBoardingDetails(
                title: "Stay in Sync with Your Dentist".tr,
                body:
                    "Manage appointments, stay updated, and never miss a booking"
                        .tr,
                url: Imagesurl.docotr,
              ),
              OnBoardingDetails(
                title: "Your Day, Organized".tr,
                body:
                    "View upcoming bookings and manage your time with ease".tr,
                url: Imagesurl.appointment,
              ),
            ],
          ),
          OnBoardingScroll(
            splashController: splashController,
            onLastPage: onlastPage,
          ),
        ],
      ),
    );
  }
}
