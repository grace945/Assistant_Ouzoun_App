import 'package:assistantapp/view/scheduling/widget/empty_vacation.dart';
import 'package:assistantapp/view/scheduling/widget/loading_animation.dart' show LoadingAnimationWidget;
import 'package:assistantapp/view/scheduling/widget/vacation_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/schedule_controller.dart';

class DisplayVacation extends StatelessWidget {
  const DisplayVacation({super.key});

  @override
  Widget build(BuildContext context) {
    final schedulecontroller _controller = Get.put(schedulecontroller());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_controller.isLoading.value && _controller.vacations.isEmpty) {
            return const LoadingAnimationWidget();
          }

          if (_controller.vacations.isEmpty) {
            return EmptyVacationWidget(
              searchQuery: _controller.searchQuery.value,
            );
          }

          return VacationList(
            controller: _controller,
            isDarkMode: isDarkMode,
          );
        }),
      ),
    );
  }
}

