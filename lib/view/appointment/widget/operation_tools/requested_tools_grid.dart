
import 'package:flutter/material.dart';
import 'package:assistantapp/view/appointment/model/Cardmodel.dart';
import 'package:assistantapp/core/constances/colors.dart';
import 'package:get/get.dart';


class RequestedToolsGrid extends StatelessWidget {
  final List<Cardmodel> tools;

  const RequestedToolsGrid({super.key, required this.tools});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > 600 ? 4 : 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: tools.length,
      itemBuilder: (context, index) => Card(
        color: const Color(0xFFF5F5F5),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap:() async{
              Get.to(()=>tools[index].navigateTo());
              await tools[index].fetchData!();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(tools[index].icon, size: 32, color: green),
                const SizedBox(height: 10),
                Text(
                  tools[index].name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
