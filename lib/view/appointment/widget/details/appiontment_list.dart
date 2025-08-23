import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/appointment/appiontment_controller.dart';
import 'appiontment_card.dart';
import 'package:lottie/lottie.dart';
class AppiontmentList extends StatefulWidget {
  const AppiontmentList({super.key});

  @override
  State<AppiontmentList> createState() => _AppiontmentListState();
}

class _AppiontmentListState extends State<AppiontmentList> {
  final ApiontmentController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.getAllAppiontment();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Obx(() {
      if (controller.offsets.length != controller.displayedAppiontments.length) {
        return Center(
          child: Lottie.asset(
            'assets/animations/Animation - 1740348375718.json',
            fit: BoxFit.cover,
            repeat: true,
            height: 150,
            width: 150,
          ),
        );
      }
      if (controller.isLoadingAppiontment.value) {
        return Center(
          child: Lottie.asset(
            'assets/animations/Animation - 1740348375718.json',
            fit: BoxFit.cover,
            repeat: true,
            height: 150,
            width: 150,
          ),
        );
      }

      if (controller.displayedAppiontments.isEmpty) {
        return Center(
          child: Text(
            "There is no appiontment ً",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        );
      }
      return ListView.separated(
        itemCount: controller.displayedAppiontments.length,
        separatorBuilder: (_, __) => SizedBox(height: height * 0.01),
        itemBuilder: (_, index) {
          final item = controller.displayedAppiontments[index];
          final formattedDate = DateFormat.yMMMMd().format(item.date);
          final formattedTime = DateFormat.jm().format(item.date);
          return SlideTransition(
            position: controller.offsets[index],
            child: GestureDetector(
              onTap: () {
                controller.getAppiontmentDetailseById(item.id.toString());
                controller.goToDetails({'id': item.id.toString(),'procedureid':item.id});
            
              },
              child: Appiontmentcard(
                time: formattedTime,
                date: formattedDate,
                doctorname: item.doctor?.userName ?? '',
                status: item.status,
              ),
            ),
          );
        },
      );
    });
  }
}
