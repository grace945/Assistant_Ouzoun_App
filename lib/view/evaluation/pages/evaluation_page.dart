import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../models/review_model.dart';
import '../../../core/class/custom_app_bar.dart';
import '../controller/evaluation_controller.dart';
import '../widget/current_evaluation.dart';
import '../widget/evaluation_item.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReviewController controller = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Obx(() => CustomAppBar(
          title: "Procedure Evaluation",
          subtitle: "",
          showsearch: true,
          isSearching: controller.isSearching.value,
          onSearchChanged: controller.searchReviews,
          onSearchToggle: () {
            if (controller.isSearching.value) {
              controller.isSearching(false);
              controller.searchReviews("");
            } else {
              controller.isSearching(true);
            }
          },
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.isLoading.value) {
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

          if (controller.filteredReviews.isEmpty) {
            return const Center(child: Text("No reviews found."));
          }

          final latestReview = controller.filteredReviews
              .firstWhereOrNull((r) => r.isLatest);

          final previousReviews = controller.filteredReviews
              .where((r) => !r.isLatest)
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (latestReview != null)
                CurrentEvaluation(
                  doctorName: latestReview.doctorName,
                  note: latestReview.note ?? "No note provided.",
                  ratingNumber: latestReview.rate.toDouble(),
                ),
              const SizedBox(height: 24),
              if (previousReviews.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: previousReviews.length,
                    itemBuilder: (context, index) {
                      final eval = previousReviews[index];
                      return SlideTransition(
                        position: controller.offsets[index],
                        child: EvaluationItem(
                          name: eval.doctorName,
                          comment: eval.note ?? "",
                        ),
                      );
                    },
                  ),
                )
              else
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "No previous evaluations found.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}





