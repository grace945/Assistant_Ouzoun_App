import 'package:assistantapp/models/off_days_model/off_days_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/api/schedule_api.dart';
import '../../../core/services/helper.dart';
import '../../../models/off_days_model/off_day_request.dart';

class schedulecontroller extends GetxController with GetTickerProviderStateMixin {

  final Rxn<DateTime> fromDate = Rxn<DateTime>();
  final Rxn<DateTime> toDate   = Rxn<DateTime>();

  late TextEditingController textcontroller;
  RxBool isLoading = false.obs;
  RxList<VacationModel> vacations = <VacationModel>[].obs;
  List<VacationModel>vacation=[];
  late final scheduleApi _api;
  final List<AnimationController> controllers = [];
  final List<Animation<Offset>> offsets = [];
  bool _isDisposed = false;
  RxString searchQuery="".obs;

  @override
  void onInit() {
    super.onInit();
    textcontroller = TextEditingController();
    _api = scheduleApi(Dio(BaseOptions(
      contentType: "application/json",
      validateStatus: (status) => true,
    )));
    loadVacations();
    ever(searchQuery, (_) => applyFilter());

  }

  void setRange(DateTime start, DateTime end) {
    fromDate.value = DateTime(start.year, start.month, start.day);
    toDate.value   = DateTime(end.year, end.month, end.day);
  }

  Future<void> submitHoliday() async {
    if (fromDate.value == null || toDate.value == null) {
      Get.snackbar("Alert", "Please select a start and end date");
      return;
    }
    if (toDate.value!.isBefore(fromDate.value!)) {
      Get.snackbar("Alert", "The end date must be after the start date");
      return;
    }

    isLoading.value = true;

    String formatDate(DateTime d) =>
        "${d.year.toString().padLeft(4,'0')}-${d.month.toString().padLeft(2,'0')}-${d.day.toString().padLeft(2,'0')}";

    final model = OffDayRequest(from: formatDate(fromDate.value!), to:formatDate(toDate.value!),  note: textcontroller.text,);

    final helper _prefeshelpre = Get.find<helper>();
    String? token = _prefeshelpre.prefs.getString("token");

    try {
      final response = await _api.scheduleOffDay(model, "Bearer $token");

      if (response.statusCode == 201) {
        Get.snackbar("✅ Done", "your off days has been created successfully");
        fromDate.value = null;
        toDate.value = null;
        textcontroller.clear();
        loadVacations();
      } else {
        print(response.data);
        print(response.statusCode);
        Get.snackbar("📛 Error", "Faild ");
      }
    } catch (e) {
      Get.snackbar("📛 Error", "Server Erorr");
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> loadVacations() async {
    try {
      isLoading.value = true;
      final helper _prefeshelpre = Get.find<helper>();
      String? token = _prefeshelpre.prefs.getString("token");
      /*final data = await _api.getScheduleOffDay("Bearer $token");*/
      vacation=await _api.getScheduleOffDay("Bearer $token");
      vacations.assignAll(vacation);
      _initAnimations();
    } catch (e) {
    print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deletVacations(String id) async {
      final helper _prefeshelpre = Get.find<helper>();
      String? token = _prefeshelpre.prefs.getString("token");
      await _api.deleteHoliday(id, "Bearer $token");
      vacations.removeWhere((v) => v.id.toString() == id);
      Get.snackbar("✅ Done", "Deleted Successfully");
      await loadVacations();
  }
  void applyFilter() {
    final query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      vacations.assignAll(vacation);
    } else {
      vacations.assignAll(
        vacation.where(
               (item) => (item.note).toLowerCase().contains(query),
        ),
      );
    }
    _initAnimations();
  }

  void _initAnimations() {
    controllers.forEach((c) => c.dispose());
    controllers.clear();
    offsets.clear();
    for (int i = 0; i < vacations.length; i++) {
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

  @override
  void onClose() {
    textcontroller.dispose();
    super.onClose();
  }
}
