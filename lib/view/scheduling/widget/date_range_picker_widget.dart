import 'package:assistantapp/core/constances/colors.dart';
import 'package:assistantapp/view/scheduling/controller/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePickerWidget extends StatelessWidget {
  final schedulecontroller controller;
  const DateRangePickerWidget({super.key, required this.controller});

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final start = args.value.startDate;
      final end = args.value.endDate ?? args.value.startDate;
      if (start != null && end != null) {
        controller.setRange(start, end);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
      ],
    );
  }
}