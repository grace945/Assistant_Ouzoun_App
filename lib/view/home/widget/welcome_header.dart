

import 'package:flutter/material.dart';

class Welcomeheader extends StatelessWidget {
   Welcomeheader({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
      "HI Doctor, Joseph! 👋",
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    SizedBox(height: 8),
    Text(
    "Ready to manage your schedule and tasks today?",
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
          ),
    ],
    );
  }
}
