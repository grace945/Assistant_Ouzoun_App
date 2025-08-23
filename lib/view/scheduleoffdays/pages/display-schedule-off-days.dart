import 'package:assistantapp/widgets/custom_widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constances/colors.dart';
import '../../../models/off_days_model/vacation-status.dart';
import '../controller/schedulecontroller.dart';
import 'package:lottie/lottie.dart';

class VacationRequestPage extends StatelessWidget {
  const VacationRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final schedulecontroller _controller = Get.put(schedulecontroller());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: Customappbar(
        title: "Off-Days",
        subtitle: "your off_days you have requested is here",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                onChanged: (value) {
                  _controller.searchQuery.value = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: green),
                  hintText: 'Search by note',
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (_controller.isLoading.value &&
                    _controller.vacations.isEmpty) {
                  return Center(
                    child: Lottie.asset(
                      'assets/animations/Animation - 1740348375718.json',
                      fit: BoxFit.cover,
                      repeat: true,
                      height: 150,
                      width: 150,
                    ),
                  );
                }
                if (_controller.vacations.isEmpty) {
                  if (_controller.searchQuery.value.isNotEmpty) {
                    return Center(
                      child: Text(
                        "No results found for '${_controller.searchQuery.value}'.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "No vacations found.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }
                }
                return Obx(
                  () => ListView.builder(
                    itemCount: _controller.vacations.length,
                    itemBuilder: (context, index) {
                      if (index >= _controller.offsets.length) {
                        return const SizedBox.shrink();
                      }

                      final vacationItem = _controller.vacations[index];
                      final formattedFromDate = vacationItem.from
                          .toLocal()
                          .toString()
                          .split(' ')[0];
                      final formattedToDate = vacationItem.to
                          .toLocal()
                          .toString()
                          .split(' ')[0];

                      return SlideTransition(
                        position: _controller.offsets[index],
                        child: Card(
                          color: Theme.of(context).colorScheme.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 6,
                          shadowColor: isDarkMode ? Colors.grey[100] : black,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ), // هامش بين البطاقات
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "From: ",
                                      style: TextStyle(color: green),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      formattedFromDate,
                                      style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "To: ",
                                      style: TextStyle(color: green),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      formattedToDate,
                                      style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      vacationItem.status.name.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                vacationItem.status ==
                                                    VacationStatus.Accepted
                                                ? green
                                                : vacationItem.status ==
                                                      VacationStatus.pending
                                                ? Colors.orange
                                                : Colors.red,
                                            fontSize: 14,
                                          ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        _controller.deletVacations(
                                          vacationItem.id.toString(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Note: ",
                                      style: TextStyle(color: green),
                                    ),
                                    SizedBox(width: 2),
                                    Expanded(
                                      child: Text(
                                        vacationItem.note,
                                        style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
