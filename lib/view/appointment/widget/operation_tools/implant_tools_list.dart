import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';

class ImplantToolsList extends StatelessWidget {
  final List<dynamic>? tools;

  const ImplantToolsList({super.key, required this.tools});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (tools == null || tools!.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.build_outlined,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              "No tools available for this implant",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tools!.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        final tool = tools![index];
        return ToolCard(tool: tool, isDarkMode: isDarkMode);
      },
    );
  }
}

class ToolCard extends StatelessWidget {
  final dynamic tool;
  final bool isDarkMode;

  const ToolCard({
    super.key,
    required this.tool,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tool name header
          Row(
            children: [
              Icon(
                Icons.build,
                size: 20,
                color:green,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  tool.name ?? 'Unknown Tool',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Tool specifications in a clean grid
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[800] : Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                _buildSpecRow(
                  context,
                  'Quantity',
                  tool.quantity?.toString() ?? 'N/A',
                  Icons.inventory_2_outlined,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildSpecRow(
                        context,
                        'Width',
                        tool.width?.toString() ?? 'N/A',
                        Icons.straighten,
                        isCompact: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSpecRow(
                        context,
                        'Height',
                        tool.height?.toString() ?? 'N/A',
                        Icons.height,
                        isCompact: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildSpecRow(
                  context,
                  'Thickness',
                  tool.thickness?.toString() ?? 'N/A',
                  Icons.layers_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecRow(
      BuildContext context,
      String label,
      String value,
      IconData icon, {
        bool isCompact = false,
      }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisSize: isCompact ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Icon(
          icon,
          size: 16,
          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Text(
          '$label:',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
