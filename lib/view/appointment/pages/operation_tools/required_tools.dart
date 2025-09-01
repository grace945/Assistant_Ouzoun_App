import 'package:assistantapp/core/constances/colors.dart';
import 'package:assistantapp/core/class/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/operation_tools/tools_controller.dart';
import '../../widget/operation_tools/Tools_build_card.dart';
import 'package:lottie/lottie.dart';
class RequiredToolsPage extends StatelessWidget {
  final ToolsController controller = Get.find();

  RequiredToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 600;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      appBar: CustomAppBar(
        title: "Required Tools",
        subtitle: "",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
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

          if (controller.tools.isEmpty) {
            return Center(
              child: Text(
                "No required tools found.",
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            );
          }
          return ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [green.withOpacity(0.9), green.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: green.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.medical_services_outlined,
                        color: Colors.white, size: 40),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Hello Doctor,\nHere are all the required tools for your procedure.',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.tools.length,
                itemBuilder: (context, index) {
                  final tool = controller.tools[index];
                  return ToolsBuildCard(tool: tool, isSmall: isSmall);
                },
              )
            ],
          );
        }),
      ),
    );
  }
}



