import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constances/theme.dart';
import '../../model/notifications_model.dart';
import 'notification_card.dart';
import 'package:intl/intl.dart';
class NotificationDateSection extends StatelessWidget {
  final DateTime date;
  final List<NotificationModel> items;

  const NotificationDateSection({
    super.key,
    required this.date,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == darkMode.brightness;
    final String formattedDate = DateFormat.yMMMMd().format(date);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formattedDate,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),

            ListView.separated(
              separatorBuilder: (_, __) => SizedBox(height: 11),
              itemCount: items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return NotificationCard(
                  title: items[i].title,
                  desc: items[i].body,
                  isDarkMode: isDarkMode,
                );
              },
            ),
        ],
      ),
    );
  }
}