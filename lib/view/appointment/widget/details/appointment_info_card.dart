import 'package:flutter/material.dart';
import 'package:assistantapp/core/constances/colors.dart';
import 'package:get/get.dart';
import '../../controller/appointment/appiontment_controller.dart';
import '../../pages/details/locatin_map.dart';
import 'package:lottie/lottie.dart';
class AppointmentInfoCard extends StatelessWidget {
  final String date;
  final String time;
  final String address;
  final String id;

  const AppointmentInfoCard({
    super.key,
    required this.date,
    required this.time,
    required this.address,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ApiontmentController _controller = Get.find();
    return Container(
      width: width,
      height: 190,
      child: Obx(()=> _controller.displayedAppiontments.isEmpty?Center(
        child: Lottie.asset(
          'assets/animations/Animation - 1740348375718.json',
          fit: BoxFit.cover,
          repeat: true,
          height: 150,
          width: 150,
        ),
      ):
          Card(
          color: green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today_sharp, size: 20, color: notes),
                    SizedBox(width: 8),
                    Text(
                      "Upcoming Appointment",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[300]),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        address,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(icon: Icon(Icons.location_on_sharp, color: notes, size: 20),
                        onPressed: ()
                    {
                        Get.to(LocatinMap(endLat: _controller.endLat.value,
                       endLng: _controller.endLng.value,));
                      _controller.getAppiontmentDetailseById(id);
                    }
                    ),

                    SizedBox(width: 4),
                    Text(
                      "View in map",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
