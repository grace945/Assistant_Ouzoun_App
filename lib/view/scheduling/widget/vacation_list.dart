import 'package:assistantapp/view/scheduling/controller/schedule_controller.dart';
import 'package:assistantapp/view/scheduling/widget/vacation_card.dart';
import 'package:flutter/material.dart';

class VacationList extends StatelessWidget {
  final schedulecontroller controller;
  final bool isDarkMode;

  const VacationList({
    super.key,
    required this.controller,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.vacations.length,
      itemBuilder: (context, index) {
        final vacationItem = controller.vacations[index];
        return SlideTransition(
          position: controller.offsets[index],
          child: VacationCard(
            vacationItem: vacationItem,
            controller: controller,
            isDarkMode: isDarkMode,
          ),
        );
      },
    );
  }
}
