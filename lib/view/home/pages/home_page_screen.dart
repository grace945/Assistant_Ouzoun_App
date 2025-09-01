
import 'package:assistantapp/view/home/controller/homepagecontroller.dart';
import 'package:assistantapp/view/home/widget/build_full_width_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/custom_app_bar.dart';
import '../widget/build_card.dart';
import '../widget/welcome_header.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Homepagecontroller controller=Get.find();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Welcomeheader(),
            SizedBox(height: size.height * 0.07),
            Row(
              children: [
                Expanded(
                  child: Buildcard(
                    title: "Notes",
                    icon: Icons.note_alt,
                    onTap: () {
                      controller.goToNotesPage();
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Buildcard(
                    title: "Schedule Off",
                    icon: Icons.event_busy,
                    onTap: () {
                      controller.goToSchedulePage();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Buildfullwidthcrad(
              title: "Appointments",
              icon: Icons.calendar_today,
              onTap: () {
               controller.goToAppointmentPage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
