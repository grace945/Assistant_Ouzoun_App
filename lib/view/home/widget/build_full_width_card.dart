
import 'package:flutter/material.dart';

import '../../../core/constances/colors.dart';

class Buildfullwidthcrad extends StatelessWidget {
   Buildfullwidthcrad ({super.key,required this.title,required this.icon,required this.onTap});
   String title;
   IconData icon;
   VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: green,
    child: Container(
    height: 170,
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(icon, size: 40, color: Colors.white),
    SizedBox(width: 16),
    Text(
    title,
    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
),
],
),
),
),
);;
  }
}
