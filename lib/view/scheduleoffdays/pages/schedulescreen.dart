import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../Routes/AppRoutes.dart';
import '../../../widgets/custom_widgets/CustomButton.dart';
import '../../../widgets/custom_widgets/customappbar.dart';
import '../controller/schedulecontroller.dart'; // حدّث المسار حسب مشروعك

class Schedulescreen extends StatelessWidget {
  const Schedulescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // إنشاء/الحصول على الكنترولر
    final schedulecontroller controller = Get.put(schedulecontroller());

    void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
      if (args.value is PickerDateRange) {
        final start = args.value.startDate;
        final end = args.value.endDate ?? args.value.startDate;
        if (start != null && end != null) {
          controller.setRange(start, end);
        }
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar:  Customappbar(
        title: "Request Vacation",
        subtitle: "you can request a vacation",
      ),
      body: Obx(() {
        final isLoading = controller.isLoading.value;

        return AbsorbPointer(
          absorbing: isLoading,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Text(
                      "Choose Period",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: greenlight),
                    ),
                    const SizedBox(height: 10),
                    SfDateRangePicker(
                      selectionMode: DateRangePickerSelectionMode.range,
                      onSelectionChanged: _onSelectionChanged,
                      monthViewSettings: const DateRangePickerMonthViewSettings(
                        firstDayOfWeek: 6, // السبت
                      ),
                      todayHighlightColor: green,
                      selectionColor: green,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      endRangeSelectionColor: green,
                      rangeSelectionColor: greenlight.withOpacity(0.3),
                      startRangeSelectionColor: green,
                    ),

                    const SizedBox(height: 20),
                    Obx(() {
                      final f = controller.fromDate.value;
                      final t = controller.toDate.value;
                      if (f == null || t == null) return const SizedBox.shrink();
                      String _fmt(DateTime d) =>
                          "${d.year.toString().padLeft(4,'0')}-${d.month.toString().padLeft(2,'0')}-${d.day.toString().padLeft(2,'0')}";

                      return Card(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "From: ${_fmt(f)}\nTo:   ${_fmt(t)}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    }),

                    Text(
                      "Your Note",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: greenlight),
                    ),
                    const SizedBox(height: 10),

                    TextField(
                      controller: controller.textcontroller,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Write Your Note...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                    Custombutton(
                      color: green,
                      text: isLoading ? "Sending..." : "Request",
                      onTap: () {
                        final f = controller.fromDate.value;
                        final t = controller.toDate.value;
                        final note = controller.textcontroller.text.trim();
                        if (f == null || t == null) {
                          Get.snackbar("Warning", "Please select both start and end dates");
                          return;
                        }
                        if (t.isBefore(f)) {
                          Get.snackbar("Warning", "End date must be after or equal to start date");
                          return;
                        }
                        if (note.isEmpty) {
                          Get.snackbar("Warning", "Please enter your note");
                          return;
                        }
                        controller.submitHoliday();
                      },
                    ),


                  ],
                ),
              ),

            ],
          ),
        );
      }),
    );
  }
}



