

import 'package:assistantapp/core/class/custom_app_bar.dart';
import 'package:assistantapp/core/constances/colors.dart';
import 'package:assistantapp/view/appointment/model/get_tool_data_model.dart';
import 'package:assistantapp/view/appointment/widget/operation_tools/Tools_build_card.dart';
import 'package:flutter/material.dart';



class ImplantDetails extends StatelessWidget {
  final Implant implant;
  final List<Tool> tools;

  const ImplantDetails({
    super.key,
    required this.implant,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar:CustomAppBar(title: "ImplantDetails", subtitle: "tools&implant"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // صورة implant
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                "assets/images/orthodontic.png",
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Implant",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: greenlight,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.4)
                        : Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow("Brand", implant.brand ?? "", isDarkMode),
                    Divider(color: green,),
                    _buildDetailRow("Height", "${implant.height} cm", isDarkMode),
                    Divider(color: green,),
                    _buildDetailRow("Width", "${implant.width}", isDarkMode),
                    Divider(color: green,),
                    _buildDetailRow("Radius", "${implant.radius}", isDarkMode),
                    Divider(color: green,),
                    _buildDetailRow("Quantity", "${implant.quantity}", isDarkMode),
                    Divider(color: green,),
                    _buildDetailRow("Description", "${implant.description}", isDarkMode),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),


            Text(
              "Tools",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: greenlight,
              ),
            ),
            const SizedBox(height: 10),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tools.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final tool = tools[index];
                return ToolsBuildCard(tool:tool,isSmall: true,);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

