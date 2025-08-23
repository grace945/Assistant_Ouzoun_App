

import 'package:flutter/material.dart';

import '../../../core/constances/colors.dart';


class EvaluationItem extends StatelessWidget {
  final String name;
  final String comment;

  const EvaluationItem({
    super.key,
    required this.name,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.favorite, color: greenlight),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name ',
                  style:Theme.of(context).textTheme.bodyMedium!.copyWith(color: isDarkMode?Colors.white:Colors.black)
                ),

                const SizedBox(height: 7),
                Text(comment),
              ],
            ),
          )
        ],
      ),
    );

  }
}
