import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/operation_tools/implant_card.dart';
import '../../../../core/class/custom_app_bar.dart';
import '../../controller/operation_tools/implant_controller.dart';
import 'package:lottie/lottie.dart';

class ImplantKitsPage extends StatelessWidget {
  final ImplantKitController controller = Get.find();

  ImplantKitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      appBar: CustomAppBar(
        title: "Implant Kit",
        subtitle: "Details & Tools",
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
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

        if (controller.implantKits.isEmpty) {
          return const Center(
            child: Text("No implant kits available.",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.implantKits.length,
          itemBuilder: (context, index) {
            final kit = controller.implantKits[index];
            return ImplantCard(kit: kit);
          },
        );
      }),
    );
  }
}



