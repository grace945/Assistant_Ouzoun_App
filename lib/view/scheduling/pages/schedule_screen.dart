import 'package:assistantapp/core/constances/colors.dart';
import 'package:assistantapp/view/scheduling/widget/date_range_picker_widget.dart';
import 'package:assistantapp/view/scheduling/widget/note_input_field.dart'
    show NoteInputField;
import 'package:assistantapp/view/scheduling/widget/selected_range_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../core/class/custom_button.dart';
import '../../../core/class/custom_app_bar.dart';
import '../controller/schedule_controller.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      appBar: CustomAppBar(
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
                    const SizedBox(height: 10),
                    DateRangePickerWidget(controller: controller),

                    const SizedBox(height: 20),
                    SelectedRangeCard(controller: controller),

                    const SizedBox(height: 20),
                    NoteInputField(controller: controller),

                    const SizedBox(height: 40),
                    Custombutton(
                      color: green,
                      text: isLoading ? "Sending..." : "Request",
                      onTap: () {
                        final f = controller.fromDate.value;
                        final t = controller.toDate.value;
                        final note = controller.textcontroller.text.trim();
                        if (f == null || t == null) {
                          Get.snackbar(
                            "Warning",
                            "Please select both start and end dates",
                          );
                          return;
                        }
                        if (t.isBefore(f)) {
                          Get.snackbar(
                            "Warning",
                            "End date must be after or equal to start date",
                          );
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
