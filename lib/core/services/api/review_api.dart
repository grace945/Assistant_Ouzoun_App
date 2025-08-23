import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/evaluation_model/review_model.dart';


part 'review_api.g.dart';

@RestApi(baseUrl: "http://ouzon.somee.com/api/" )
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("Ratings/CurrentAssistantRatings")
  Future<List<ReviewModel>> getReviews( @Header("Authorization") String token,);
}
