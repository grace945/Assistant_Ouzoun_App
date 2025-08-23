import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../models/off_days_model/off_day_request.dart';
import '../../../models/off_days_model/off_days_model.dart';
part 'schedule_api.g.dart';
@RestApi(baseUrl: "http://ouzon.somee.com/api/")
abstract class scheduleApi {
  factory scheduleApi(Dio dio, {String baseUrl}) = _scheduleApi;

  @POST("holidays")
  Future<Response> scheduleOffDay(@Body() OffDayRequest request, @Header("Authorization") String token,);
  @GET("holidays")
  Future<List<VacationModel>> getScheduleOffDay( @Header("Authorization") String token);
  @DELETE("holidays/{id}")
  Future<void> deleteHoliday(@Path("id") String id,@Header("Authorization") String token);

}