import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';

import '../controller/schedule_controller.dart';

class NoteInputField extends StatelessWidget {
  final schedulecontroller controller;
  const NoteInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}