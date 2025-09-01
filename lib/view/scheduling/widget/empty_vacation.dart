import 'package:flutter/material.dart';

class EmptyVacationWidget extends StatelessWidget {
  final String searchQuery;
  const EmptyVacationWidget({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    if (searchQuery.isNotEmpty) {
      return Center(
        child: Text(
          "No results found for '$searchQuery'.",
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    } else {
      return const Center(
        child: Text(
          "No vacations found.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
  }
}