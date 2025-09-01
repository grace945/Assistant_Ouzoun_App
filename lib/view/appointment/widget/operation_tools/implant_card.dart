
import 'package:assistantapp/view/appointment/model/appiontment_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constances/colors.dart';
import '../../controller/operation_tools/implant_controller.dart';
import '../../model/get_tool_data_model.dart';
import 'implant_detalis.dart';



class ImplantCard extends StatelessWidget {
  final ImplantKit kit;


  const ImplantCard({super.key, required this.kit});

  @override
  Widget build(BuildContext context) {
    final implant = kit.implant;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;


    if (implant == null) {
      return Card(
        margin: const EdgeInsets.only(bottom: 20),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text("No implant data available.",
              style: TextStyle(color: Colors.grey)),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
         padding: EdgeInsets.all(16),
           decoration: BoxDecoration(
             color: isDarkMode ? Colors.grey[850] : Colors.white,
             borderRadius: BorderRadius.circular(12),
             border: Border.all(
               color: isDarkMode ? Colors.grey[700]! : Colors.grey[200]!,
               width: 1,
             ),
             boxShadow: [
               BoxShadow(
                 color: isDarkMode
                     ? Colors.black.withOpacity(0.3)
                     : Colors.grey.withOpacity(0.1),
                 blurRadius: 8,
                 offset: const Offset(0, 2),
               ),
             ],
           ),
           child: InkWell(
             onTap:(){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (_) => ImplantDetails(
                     implant: implant,
                     tools: kit.toolsWithImplant ?? [],
                   ),
                 ),
               );
             },
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 // Icon or Placeholder Image
                 Container(
                     width: 50,
                     height: 50,
                     decoration: BoxDecoration(
                       color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                       borderRadius: BorderRadius.circular(12),
                     ),
                     child:Image.network(implant.imagePath.toString(),fit: BoxFit.contain,),
                   ),

                 const SizedBox(width: 12),

                 // Tool details
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                          implant.brand ?? "",
                         style: Theme.of(context).textTheme.titleMedium?.copyWith(
                           color: isDarkMode ? Colors.white : Colors.black,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       const SizedBox(height: 8),

                       Wrap(
                         spacing: 12,
                         runSpacing: 8,
                         children: [
                           _buildDetail(
                             context,
                             icon: Icons.height,
                             label: "Height",
                             value: "${implant.height} cm",
                             isDark: isDarkMode,
                           ),
                           _buildDetail(
                             context,
                             icon: Icons.swap_horiz,
                             label: "Width",
                             value: "${implant.width}",
                             isDark: isDarkMode,
                           ),
                           _buildDetail(
                             context,
                             icon: Icons.radio_button_unchecked,
                             label: "Radius",
                             value: "${implant.radius}",
                             isDark: isDarkMode,
                           ),
                           _buildDetail(
                             context,
                             icon: Icons.format_list_numbered,
                             label: "Qty",
                             value: "${implant.quantity}",
                             isDark: isDarkMode,
                           ),
                           _buildDetail(
                             context,
                             icon: Icons.medication_liquid_sharp,
                             label: "Tools count",
                             value: "${kit.toolsWithImplant?.length}",
                             isDark: isDarkMode,
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         )

    );
  }
}
Widget _buildDetail(BuildContext context,
    {required IconData icon,
      required String label,
      required String value,
      required bool isDark}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 16, color:green),
      const SizedBox(width: 5),
      Text(
        "$label: ",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: isDark ? Colors.white70 : Colors.black87,
        ),
      ),
      Text(
        value,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: isDark ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}


