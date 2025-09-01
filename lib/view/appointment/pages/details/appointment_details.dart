
import 'package:assistantapp/core/class/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/constances/colors.dart';
import '../../model/Cardmodel.dart';
import '../../../../models/change_operation_status/change_status_model.dart';
import '../../../../core/class/custom_button.dart';
import '../../controller/appointment/appiontment_controller.dart';
import '../../controller/operation_tools/implant_controller.dart';
import '../../controller/operation_tools/surgical_kit_controller.dart';
import '../../controller/operation_tools/tools_controller.dart';
import '../../widget/details/appointment_info_card.dart';
import '../../widget/operation_tools/requested_tools_grid.dart';
import '../operation_tools/Surgical_kit.dart';
import '../operation_tools/implant_kit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../operation_tools/required_tools.dart';

class Appointmentdetails extends StatelessWidget {
  final String id;
  final int procedureid;

  Appointmentdetails({super.key, required this.id,required this.procedureid});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaqurey = MediaQuery.of(context);
    final ApiontmentController _controller = Get.find();
    final KitController _kitcontroller = Get.find();
    final ImplantKitController _implantController = Get.find();
    final ToolsController _toolsController = Get.find();

    final List<Cardmodel> tools = [
      Cardmodel(
        name: 'Implant Kits',
        icon: Icons.medical_services,
        fetchData: () async => await _implantController.loadImplantKits(id),
        navigateTo: () => ImplantKitsPage(),
      ),
      Cardmodel(
        name: 'Surgical Kits',
        icon: Icons.healing,
        fetchData: () async => await _kitcontroller.loadKitData(id),
        navigateTo: () => SurgicalKitPage(),
      ),
      Cardmodel(
        name: 'Required Tools',
        icon: Icons.build,
        fetchData: () async => await _toolsController.loadRequiredTools(id),
        navigateTo: () => RequiredToolsPage(),
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(
        title: "Details",
        subtitle: "Your appointment details",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: Obx(() {
            if (_controller.isLoading.value) {
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

            final appointmentDate = _controller.detalis.value?.date;
            final formattedDate = appointmentDate != null
                ? DateFormat.yMMMMd().format(appointmentDate)
                : 'No Date Found';
            final formattedTime = appointmentDate != null
                ? DateFormat.jm().format(appointmentDate)
                : 'No Time Found';
            final address = _controller.clinic.value?.address ?? 'No Address Found';

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppointmentInfoCard(
                  date: formattedDate,
                  time: formattedTime,
                  address: address,
                  id: id,
                ),
                const SizedBox(height: 40),
                Text(
                  "Requested Tools",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                Expanded(child: RequestedToolsGrid(tools: tools)),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: mediaqurey.padding.bottom + 20,
                    top: 4,
                  ),
                  child: Custombutton(
                    onTap: () {
                      final model=ChangeStatueModel(procedureid, 3);
                      _controller.changeStatus(model);
                      _controller.getAllAppiontment();
                    },
                    text: "finished operation ",
                    color: green,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

