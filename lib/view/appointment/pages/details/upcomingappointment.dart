
import 'package:assistantapp/core/constances/colors.dart';
import 'package:flutter/material.dart';
import '../../controller/appointment/appiontment_controller.dart';
import '../../widget/details/appiontment_list.dart';
import '../../../../widgets/custom_widgets/customappbar.dart';
import 'package:get/get.dart';
class Upcomingappointment extends StatelessWidget {
  const Upcomingappointment({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiontmentController controller = Get.find();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: Customappbar(
        title: "Appointments",
        subtitle: "this is your upcoming appointments ",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                onChanged: (value) {
                  controller.searchQuery.value = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: green,),
                  hint: Text('Search by Doctor Name' ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15)  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              child: AppiontmentList(),
            ),
          ],
        ),
      ),
    );
  }
}
