import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/appointment_model/appiontment_model.dart';
import '../../controller/appointment/appiontment_controller.dart';



class Appiontmentcard extends StatelessWidget {
  Appiontmentcard({
    super.key,
    required this.doctorname,
    required this.time,
    required this.date,
    required this.status,
  });
  String doctorname;
  String date;
  String time;
  EnumProcedureStatus status;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    ApiontmentController controller = Get.find();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
        color: Theme.of(context).colorScheme.background,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    ),
    elevation: 6,
    shadowColor:isDarkMode?Colors.grey[100]:black,
    child: Padding(
    padding: const EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.only(left: 10, bottom: 8, top: 8, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey.shade100,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  "Dr. $doctorname",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? background : Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  date,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                SizedBox(width: width * 0.02),
                Icon(Icons.access_time, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  time,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              Spacer(),
                Text(
                  status.name.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: status == EnumProcedureStatus.DONE ? green
                        : status == EnumProcedureStatus.IN_PROGRESS ? Colors.orange
                        : Colors.red,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }
}
