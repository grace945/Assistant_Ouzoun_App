import 'package:flutter/material.dart';

import '../../../../models/appointment_model/get_tool_data_model.dart';
import 'implant_info_card.dart';
import 'implant_tools_list.dart';


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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة الزرع
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  implant.imagePath ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj4tpiucpbeLoCT1M0f3QqJhslrnNgdpUP1w&s',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Text(
                    implant.brand ?? 'Unknown Brand',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImplantInfoRow(implant: implant),
                const SizedBox(height: 20),
                Text(
                  "Tools",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ImplantToolsList(tools: kit.toolsWithImplant),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
