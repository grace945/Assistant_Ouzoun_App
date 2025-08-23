import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';


class NotificationCard extends StatelessWidget {
  final String title;
  final String desc;
  final bool isDarkMode;

  const NotificationCard({
    super.key,
    required this.title,
    required this.desc,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: isDarkMode?Colors.white:Colors.black,width:2)),
      elevation:4,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          desc,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(Icons.add_alert,color: green,),
        ),
      ),
    );
  }
}