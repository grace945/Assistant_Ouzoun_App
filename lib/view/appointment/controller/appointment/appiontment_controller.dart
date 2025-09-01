import 'package:assistantapp/view/appointment/web_services/appiontment_api.dart';
import 'package:assistantapp/core/services/helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../model/appiontment_model.dart' hide Doctor;
import '../../model/get_tool_data_model.dart' hide Clinic;
import '../../../../models/change_operation_status/change_status_model.dart';

class ApiontmentController extends GetxController with GetTickerProviderStateMixin {
  List<AppiontmentModel> _originalAppiontments = [];
  RxList<AppiontmentModel> displayedAppiontments = <AppiontmentModel>[].obs;
  RxString searchQuery = "".obs;
  var isSearching = false.obs;
  Rx<Clinic?> clinic = Rx<Clinic?>(null);
  Rx<Doctor?> doctor = Rx<Doctor?>(null);
  Rx<AppointmentToolModel?> detalis = Rx<AppointmentToolModel?>(null);
  RxBool isLoading = true.obs;
  RxBool isLoadingAppiontment = true.obs;
  late final AppiontmentApi _api;
  RxDouble endLng = 0.0.obs;
  RxDouble endLat = 0.0.obs;
  final List<AnimationController> controllers = [];
  final List<Animation<Offset>> offsets = [];
  bool _isDisposed = false;

  @override
  void onInit() {
    super.onInit();
    _api = AppiontmentApi(
      Dio(
        BaseOptions(
          contentType: "application/json",
          validateStatus: (_) => true,
        ),
      ),
    );


    getAllAppiontment();
  }

  Future<void> getAllAppiontment() async {
    try {
      _originalAppiontments.clear();
      displayedAppiontments.clear();
      isLoadingAppiontment.value = true;
      final helper _prefesHelper = Get.find<helper>();
      String? token = _prefesHelper.prefs.getString("token");
      final response = await _api.getAllAppiontment("Bearer $token");
      if (response.isNotEmpty) {
        _originalAppiontments = response;
        displayedAppiontments.assignAll(_originalAppiontments);
        _initAnimations();
        print(response.length);
      } else {
        Get.snackbar("Error", "Empty List");
      }
    } catch (e) {
      Get.snackbar("📛 Error", "$e");
      print("📛 Error+$e");
    } finally {
      isLoadingAppiontment.value = false;
    }
  }

  void applyFilter(String query) {
    if (query.isEmpty) {
      displayedAppiontments.assignAll(_originalAppiontments);
    } else {
      displayedAppiontments.assignAll(
        _originalAppiontments.where(
          (item) => (item.doctor?.userName ?? '').toLowerCase().contains(query),
        ),
      );
    }

    _initAnimations();
  }

  void _initAnimations() {
    controllers.forEach((c) => c.dispose());
    controllers.clear();
    offsets.clear();
    for (int i = 0; i < displayedAppiontments.length; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );
      final offsetAnimation =
          Tween<Offset>(
            begin: const Offset(
              0.0,
              0.5,
            ),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
          );

      controllers.add(controller);
      offsets.add(offsetAnimation);

      Future.delayed(Duration(milliseconds: i * 150), () {
        if (!_isDisposed) controllers[i].forward();
      });
    }
  }

  Future<void> getAppiontmentDetailseById(String id) async {
    try {
      isLoading.value = true;

      final helper _prefesHelper = Get.find<helper>();
      final String? token = _prefesHelper.prefs.getString("token");

      final response = await _api.getAppiontmentById(id, "Bearer $token");

      detalis.value = response;

      if (response.doctor != null) {
        doctor.value = response.doctor;
        if (response.doctor?.clinic != null) {
          clinic.value = Clinic(
            id: response.doctor!.clinic!.id,
            name: response.doctor!.clinic!.name,
            address: response.doctor!.clinic!.address,
            longtitude: response.doctor!.clinic!.longtitude,
            latitude: response.doctor!.clinic!.latitude,
          );
          endLng.value = response.doctor?.clinic?.longtitude ?? 0.0;
          endLat.value = response.doctor?.clinic?.latitude ?? 0.0;
          print("latttttttttt${endLat.value}");
          print("lnggggggg${endLng.value}");
        } else {
          clinic.value = null;
          Get.snackbar("📢 Info", "Clinic information not found");
        }
      } else {
        doctor.value = null;
        clinic.value = null;
        Get.snackbar("📢 Info", "Doctor information not found");
      }
      print("✅ Appointment ID: ${response.id}");
      print("📅 Date: ${response.date}");
      print("👨‍⚕️ Doctor: ${response.doctor?.userName}");
      print("🏥 Clinic: ${response.doctor?.clinic?.name}");
    } catch (e) {
      Get.snackbar("📛 Error", "$e");
      print("📛 Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changeStatus(ChangeStatueModel status) async {
    try {
      final helper _prefesHelper = Get.find<helper>();
      final String? token = _prefesHelper.prefs.getString("token");

      final response = await _api.changeStatus("Bearer $token", status);

      if (response.statusCode == 200) {
        Get.snackbar("✅ Done", "Status Has Been Changed");
      } else {
        Get.snackbar("📛 Error:", "${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("📛 Error", "$e");
      print("📛 Error: $e");
    }
  }

  void goToDetails(Map<String, dynamic> details) {
    Get.toNamed('/appointmentDetails', arguments: details);
  }

  @override
  void onClose() {
    _isDisposed = true;
    for (final controller in controllers) {
      controller.dispose();
    }
    controllers.clear();
    offsets.clear();
    super.onClose();
  }


}
