import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CurrentEvaluation extends StatelessWidget {
  const CurrentEvaluation({
    super.key,
    required this.doctorName,
    required this.ratingNumber,
    required this.note,
  });

  final String doctorName;
  final double ratingNumber;
  final String note;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      width: Get.width,
      decoration: BoxDecoration(
        color: green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor name
          Text(
            doctorName,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),

          // Rating stars
          RatingBarIndicator(
            rating: ratingNumber,
            itemCount: 5,
            itemSize: 24.0,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 12),

          // Note with icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.favorite, color: greenlight, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  note,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                  softWrap: true, // يلف النص الطويل
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
