
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/appiontment_model.dart';
import '../model/get_tool_data_model.dart';
import '../../../models/change_operation_status/change_status_model.dart';
part 'appiontment_api.g.dart';


@RestApi(baseUrl: "http://ouzon.somee.com/api/")
abstract class AppiontmentApi {
  factory AppiontmentApi(Dio dio, {String baseUrl}) = _AppiontmentApi;

  @POST("procedures/FilteredProcedure")
  Future<List<AppiontmentModel>> getAllAppiontment(
      @Header("Authorization") String token,
      );

  @GET("procedures/{id}")
  Future<AppointmentToolModel> getAppiontmentById(
      @Path("id") String id,
      @Header("Authorization") String token,
      );
  @PATCH("procedures/ChangeStatus")
  Future<Response>changeStatus(
      @Header("Authorization") String token,
      @Body() ChangeStatueModel status
      );

}
