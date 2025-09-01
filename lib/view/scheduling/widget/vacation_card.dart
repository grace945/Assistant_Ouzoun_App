import 'package:assistantapp/core/constances/colors.dart';
import 'package:assistantapp/view/scheduling/controller/schedule_controller.dart';
import 'package:assistantapp/view/scheduling/models/vacation-status.dart';
import 'package:flutter/material.dart';

class VacationCard extends StatelessWidget {
  final dynamic vacationItem;
  final schedulecontroller controller;
  final bool isDarkMode;

  const VacationCard({
    super.key,
    required this.vacationItem,
    required this.controller,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final formattedFromDate = vacationItem.from.toLocal().toString().split(' ')[0];
    final formattedToDate = vacationItem.to.toLocal().toString().split(' ')[0];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 6,
      shadowColor: isDarkMode ? Colors.grey[100] : black,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// From Row
            Row(
              children: [
                Text("From: ", style: TextStyle(color: green)),
                const SizedBox(width: 2),
                Text(
                  formattedFromDate,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                 Text("To: ", style: TextStyle(color: green)),
                const SizedBox(width: 2),
                Text(
                  formattedToDate,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  vacationItem.status.toString().split('.').last.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: vacationItem.status == VacationStatus.Accepted
                        ? green
                        : vacationItem.status == VacationStatus.pending
                        ? Colors.orange
                        : Colors.red,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                  onPressed: () {
                    controller.deletVacations(vacationItem.id.toString());
                  },
                ),
              ],
            ),
            const SizedBox(height: 5),

            /// Note Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Note: ", style: TextStyle(color: green)),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    vacationItem.note,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}