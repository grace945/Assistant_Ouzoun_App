import 'package:flutter/material.dart';

import '../../../core/constances/colors.dart';


class SettingsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: green,
      elevation: 0,
      toolbarHeight: 70,
      titleSpacing: 16,
      title: Text(
        "Settings",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

