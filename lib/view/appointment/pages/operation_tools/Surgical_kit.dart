import 'package:assistantapp/core/constances/colors.dart';
import 'package:assistantapp/core/class/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/operation_tools/surgical_kit_controller.dart';
import '../../widget/operation_tools/Tools_build_card.dart';
import 'package:lottie/lottie.dart';
class SurgicalKitPage extends StatelessWidget {
  final KitController controller = Get.find();

  SurgicalKitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      appBar: CustomAppBar(
        title: "Surgical Kit",
        subtitle: "See the required data",
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

        final kit = controller.surgicalKit.value;
        if (kit == null) {
          return const Center(
            child: Text(
              "No Surgical Kit data found.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        final implants = kit.implants ?? [];
        final tools = kit.tools ?? [];

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // MAIN KIT CARD
            Text("MAIN KIT", style: Theme.of(context).textTheme.bodySmall),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: isDarkMode
                      ? [Colors.grey[900]!, Colors.grey[800]!]
                      : [Colors.white, Colors.grey[100]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode ? Colors.black54 : Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: green,
                  child: const Icon(Icons.medical_services_outlined, color: Colors.white),
                ),
                title: Text(
                  kit.name ?? "No Name",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Surgical Kit Details",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ),

            Text("TOOLS", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            tools.isEmpty
                ? _emptyMessage("No tools found.")
                :   // TOOLS SECTION
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10,),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tools.length,
              itemBuilder: (context, index) {
                final tool = tools[index];
                return ToolsBuildCard(tool: tool, isSmall: true);
              },
            ),
          ],
        );
      }),
    );
  }

  Widget _emptyMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(message, style: const TextStyle(color: Colors.redAccent)),
      ),
    );
  }
}
