import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../core/services/api/review_api.dart';
import '../../../core/services/helper.dart';
import '../../../models/evaluation_model/review_model.dart';


class ReviewController extends GetxController with GetTickerProviderStateMixin {

  var isLoading = true.obs;
  List<ReviewModel> review=[];
  var reviews = <ReviewModel>[].obs;
  final List<AnimationController> controllers = [];
  final List<Animation<Offset>> offsets = [];
  late ApiService _apiService;
  bool _isDisposed = false;
  @override
  void onInit() {
    super.onInit();
    final dio = Dio();
    _apiService = ApiService(dio);
    fetchReviews();
  }

  void fetchReviews() async {
    try {
      isLoading(true);
      final helper _prefeshelpre=Get.find<helper>();
      String ?token= _prefeshelpre.prefs.getString("token");

      final fetchedReviews = await _apiService.getReviews("Bearer $token");
      review=await _apiService.getReviews("Bearer $token");
      print("sssssssssssssssssssssssssss$fetchedReviews");
      if (fetchedReviews.isNotEmpty) {

        fetchedReviews.sort((a, b) => b.id.compareTo(a.id));
        fetchedReviews.first.isLatest = true;
      }
      reviews.assignAll(fetchedReviews);
      _initAnimations();

    } catch (e) {
      print("Error fetching reviews: $e");
    } finally {
      isLoading(false);
    }
  }
  void _initAnimations() {
    controllers.forEach((c) => c.dispose());
    controllers.clear();
    offsets.clear();
    for (int i = 0; i < reviews.length; i++) {
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

}
