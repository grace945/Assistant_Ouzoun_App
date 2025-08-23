
import 'package:flutter/material.dart';
import '../../../core/constances/colors.dart';
import '../../../models/evaluation_model/review_model.dart';
import '../../../widgets/custom_widgets/customappbar.dart';
import '../controller/evaluation_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../widget/current_evaluation.dart';
import '../widget/evaluation_item.dart';


class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ReviewController controller = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: Customappbar(title: "Procedure Evaluation", subtitle: ""),
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
            );;
          }

          if (controller.reviews.isEmpty) {
            return const Center(child: Text("No reviews found."));
          }


          final ReviewModel? latestReview = controller.reviews.firstWhereOrNull((r) => r.isLatest);


          final List<ReviewModel> previousReviews = controller.reviews.where((r) => !r.isLatest).toList();

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
              if (previousReviews.isNotEmpty) ...[
                Text(
                  'Previous Evaluations',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 12),
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
                ),
              ] else ...[
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("No previous evaluations found.",style: TextStyle(color: Colors.grey),),
                  ),
                )
              ]
            ],
          );
        }),
      ),
    );
  }
}




