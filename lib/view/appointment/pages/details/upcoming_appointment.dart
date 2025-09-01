import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';
import '../../controller/appointment/appiontment_controller.dart';
import '../../widget/details/appiontment_list.dart';
import '../../../../core/class/custom_app_bar.dart';
import 'package:get/get.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiontmentController controller = Get.find();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Obx(
          () => CustomAppBar(
            title: "Appointments",
            subtitle: "this is your upcoming appointments ",
            showsearch: true,
            isSearching: controller.isSearching.value,
            onSearchChanged: controller.applyFilter,
            onSearchToggle: () {
              if (controller.isSearching.value) {
                controller.isSearching(false);
                controller.applyFilter("");
              } else {
                controller.isSearching(true);
              }
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child:  AppiontmentList(),
      ),
    );
  }
}
