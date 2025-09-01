import 'package:flutter/material.dart';

import '../../../../core/constances/colors.dart';
import '../../model/get_tool_data_model.dart';


class ToolsBuildCard extends StatelessWidget {
  final Tool tool;
  final bool isSmall;

  const ToolsBuildCard({
    required this.tool,
    required this.isSmall,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black45 : Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isDarkMode ? Colors.white10 : Colors.grey.shade300,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(14),
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
            child:  Icon(Icons.build, color: green, size: 28),
          ),
          const SizedBox(width: 12),

          // Tool details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tool.name ?? "",
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
                      value: "${tool.height} cm",
                      isDark: isDarkMode,
                    ),
                    _buildDetail(
                      context,
                      icon: Icons.swap_horiz,
                      label: "Width",
                      value: "${tool.width}",
                      isDark: isDarkMode,
                    ),
                    _buildDetail(
                      context,
                      icon: Icons.linear_scale,
                      label: "Thickness",
                      value: "${tool.thickness}",
                      isDark: isDarkMode,
                    ),
                    _buildDetail(
                      context,
                      icon: Icons.format_list_numbered,
                      label: "Qty",
                      value: "${tool.quantity}",
                      isDark: isDarkMode,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
        const SizedBox(width: 4),
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
}
