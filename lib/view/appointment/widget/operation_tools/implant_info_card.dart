import 'package:flutter/material.dart';
import '../../../../../core/constances/colors.dart';
import '../../../../models/appointment_model/get_tool_data_model.dart';





class ImplantInfoRow extends StatelessWidget {
  final Implant implant;

  const ImplantInfoRow({super.key, required this.implant});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.grey[50],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _infoIcon(Icons.swap_horiz, "Width", implant.width.toString()),
          _infoIcon(Icons.height, "Height", implant.height.toString()),
          _infoIcon(Icons.circle_outlined, "Radius", implant.radius.toString()),
          _infoIcon(Icons.numbers, "Qty", implant.quantity.toString()),
        ],
      ),
    );
  }

  Widget _infoIcon(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 26, color: green),
        const SizedBox(height: 6),
        Text(
          "$label\n${value.isEmpty ? 'N/A' : value}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
