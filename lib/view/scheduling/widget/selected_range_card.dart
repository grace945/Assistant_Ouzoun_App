import 'package:assistantapp/view/scheduling/controller/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SelectedRangeCard extends StatelessWidget {
  final schedulecontroller controller;
  const SelectedRangeCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final f = controller.fromDate.value;
      final t = controller.toDate.value;
      if (f == null || t == null) return const SizedBox.shrink();

      String _fmt(DateTime d) =>
          "${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

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
    });
  }
}
