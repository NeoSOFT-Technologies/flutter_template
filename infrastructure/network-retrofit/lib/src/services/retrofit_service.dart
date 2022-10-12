import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/request/create_location_request.dart';
import 'package:network_retrofit/src/model/response/location_response_entity.dart';
import 'package:network_retrofit/src/model/response/timeline_data_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  @POST("locations")
  Future<HttpResponse<LocationResponseEntity>> createLocation(
    @Body() CreateLocationRequest createLocationRequest,
  );

  @GET("locations")
  Future<HttpResponse<List<LocationResponseEntity>>> getLocations();

  @GET("timelines")
  Future<HttpResponse<TimelineDataEntity>> getTimeline(
    @Query('location') String location,
    @Query('fields') List<String> fields,
    @Query('startTime') String startTime,
    @Query('endTime') String endTime,
    @Query('timesteps') String timeSteps,
  );

  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: dio.options.baseUrl);
  }
}
